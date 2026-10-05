M="media-ctl -d /dev/media0"
for p in 0 1 2 3 4 5; do $M --get-v4l2 "\"msm_vfe0_pix\":$p"; done
#  0,1: UYVY8_1X16/1920x1080   2: 480x270   3: 120x66   4,5: METADATA_FIXED/0x0

$M -V '"msm_vfe0_pix":0[fmt:SGRBG10_1X10/4080x3072]'
for p in 1 2 3; do $M --get-v4l2 "\"msm_vfe0_pix\":$p"; done
#  1: 4080x3072   2: 1020x768   3: 254x192

v4l2-compliance -u $($M -e msm_vfe0_pix)
