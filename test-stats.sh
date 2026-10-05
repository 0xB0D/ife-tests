#!/bin/sh
# AEC BHIST statistics on the PIX line: stats node streams first, then the image node.
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

STATS=$($M -e msm_vfe0_stats)
VIDEO=$($M -e msm_vfe0_video3)

# a v4l2-ctl left over from an interrupted run still owns the stats queue
pkill -f "v4l2-ctl -d $STATS" 2>/dev/null
rm -f stats.bin

# stats node: 4 buffers, 10 buffers appended to stats.bin, started before the image node
timeout 10 v4l2-ctl -d "$STATS" --stream-mmap=4 --stream-count=10 --stream-to=stats.bin &
sleep 1
yavta -B capture-mplane -c12 -I -n 5 -f NV12 -s 4080x3072 "$VIDEO"
wait
python3 "$(dirname "$0")/parse-stats.py" stats.bin
