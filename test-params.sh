#!/bin/sh
# Parameters -> statistics. A params buffer queued before the image node starts
# sets the AEC BHIST region for every frame, so each histogram must sum to
# exactly width * height / 4 quads: 2040 * 1536 / 4 = 783360 by default.
# REGION="left top width height" (pixels, even) overrides the region.
REGION=${REGION:-"0 0 2040 1536"}
HERE=$(dirname "$0")
M="media-ctl -d /dev/media0"
S=$($M -p | grep -oE "s5kjn1 [0-9]+-[0-9a-f]{4}" | head -1)
$M --reset
$M -l '"msm_csiphy3":1->"msm_csid0":0[1]'
$M -l '"msm_csid0":4->"msm_vfe0_pix":0[1]'
$M -V "\"$S\":0[fmt:SGRBG10_1X10/4080x3072]"
$M -V '"msm_csiphy3":0[fmt:SGRBG10_1X10/4080x3072]'
$M -V '"msm_csid0":0[fmt:SGRBG10_1X10/4080x3072]'
$M -V '"msm_vfe0_pix":0[fmt:SGRBG10_1X10/4080x3072]'
$M -V '"msm_vfe0_pix":1[fmt:YUYV8_1_5X8/4080x3072]'

PARAMS=$($M -e msm_vfe0_params)
STATS=$($M -e msm_vfe0_stats)
VIDEO=$($M -e msm_vfe0_video3)

# leftovers from an interrupted run still own the queues
pkill -f "v4l2-ctl -d $PARAMS" 2>/dev/null
pkill -f "v4l2-ctl -d $STATS" 2>/dev/null
rm -f stats.bin

python3 "$HERE/mk-params.py" $REGION > params.bin

# Params and stats both stream before the image node starts the line.
# v4l2-ctl counts output buffers as it queues them: with --stream-count=1 it
# would queue the buffer and stop streaming at once, flushing it before the
# line starts. With one buffer and a larger count it must wait for each buffer
# to come back - applied at line start, then once per frame - before
# requeueing it, so the node keeps streaming through the capture.
timeout 10 v4l2-ctl -d "$PARAMS" --stream-out-mmap=1 --stream-count=12 --stream-from=params.bin &
sleep 1
timeout 10 v4l2-ctl -d "$STATS" --stream-mmap=4 --stream-count=10 --stream-to=stats.bin &
sleep 1
yavta -B capture-mplane -c12 -I -n 5 -f NV12 -s 4080x3072 "$VIDEO"
wait

# enable these first if the region does not take: block validation is dev_dbg
#   echo 'file v4l2-isp.c +p' > /sys/kernel/debug/dynamic_debug/control
#   echo 'file camss-vfe-780.c +p' > /sys/kernel/debug/dynamic_debug/control
python3 "$HERE/parse-stats.py" stats.bin
set -- $REGION
echo "expected sum $(( $3 * $4 / 4 ))"
