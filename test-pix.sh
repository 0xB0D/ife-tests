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
yavta -B capture-mplane -c10 -I -n 5 -f NV12 -s 4080x3072 -F $($M -e msm_vfe0_video3)
