Run the tests like this
➜  tests git:(master) ✗ ./test-pix.sh 
Device /dev/video5 opened.
Device `Qualcomm Camera Subsystem' on `platform:acb6000.isp' (driver 'qcom-camss') supports video, capture, with mplanes.
Video format set: NV12 (3231564e) 4080x3072 field none, 1 planes: 
 * Stride 4080, buffer size 18800640
Video format: NV12 (3231564e) 4080x3072 field none, 1 planes: 
 * Stride 4080, buffer size 18800640
[   62.228558] video device 'msm_vfe0_params' does not implement .link_validate(), driver bug!
5 buffers requested.
length: 1 offset: 3615301072 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffa7492000.
length: 1 offset: 3615301072 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffa62a4000.
length: 1 offset: 3615301072 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffa50b6000.
length: 1 offset: 3615301072 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffa3ec8000.
length: 1 offset: 3615301072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffa2cda000.
0 (0) [-] none 0 18800640 B 62.149527 62.151758 15.141 fps ts mono/EoF
1 (1) [-] none 1 18800640 B 62.181055 62.188327 31.718 fps ts mono/EoF
2 (2) [-] none 2 18800640 B 62.215793 62.216721 28.787 fps ts mono/EoF
3 (3) [-] none 3 18800640 B 62.249346 62.251049 29.804 fps ts mono/EoF
4 (4) [-] none 4 18800640 B 62.282761 62.285054 29.927 fps ts mono/EoF
5 (0) [-] none 5 18800640 B 62.315912 62.316974 30.165 fps ts mono/EoF
6 (1) [-] none 6 18800640 B 62.349313 62.351304 29.939 fps ts mono/EoF
7 (2) [-] none 7 18800640 B 62.382631 62.384624 30.014 fps ts mono/EoF
8 (3) [-] none 8 18800640 B 62.415955 62.417780 30.008 fps ts mono/EoF
9 (4) [-] none 9 18800640 B 62.449227 62.451101 30.055 fps ts mono/EoF
Captured 10 frames in 0.367621 seconds (27.201860 fps, 0.000000 B/s).
5 buffers released.
➜  tests git:(master) ✗ ./test-stats.sh 
Device /dev/video5 opened.
Device `Qualcomm Camera Subsystem' on `platform:acb6000.isp' (driver 'qcom-camss') supports video, capture, with mplanes.
Video format set: NV12 (3231564e) 4080x3072 field none, 1 planes: 
 * Stride 4080, buffer size 18800640
Video format: NV12 (3231564e) 4080x3072 field none, 1 planes: 
 * Stride 4080, buffer size 18800640
5 buffers requested.
length: 1 offset: 4256529744 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff88d72000.
length: 1 offset: 4256529744 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff87b84000.
length: 1 offset: 4256529744 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff86996000.
length: 1 offset: 4256529744 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff857a8000.
length: 1 offset: 4256529744 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff845ba000.
0 (0) [-] none 0 18800640 B 68.045602 68.047875 15.157 fps ts mono/EoF
<1 (1) [-] none 1 18800640 B 68.078969 68.081226 29.970 fps ts mono/EoF
<2 (2) [-] none 2 18800640 B 68.112301 68.114680 30.001 fps ts mono/EoF
<<3 (3) [-] none 3 18800640 B 68.145570 68.148263 30.058 fps ts mono/EoF
<4 (4) [-] none 4 18800640 B 68.178624 68.179777 30.254 fps ts mono/EoF
<5 (0) [-] none 5 18800640 B 68.212216 68.214825 29.769 fps ts mono/EoF
<6 (1) [-] none 6 18800640 B 68.245540 68.248233 30.008 fps ts mono/EoF
<7 (2) [-] none 7 18800640 B 68.278735 68.280606 30.125 fps ts mono/EoF
<8 (3) [-] none 8 18800640 B 68.311878 68.313027 30.172 fps ts mono/EoF
<
9 (4) [-] none 9 18800640 B 68.345243 68.347431 29.972 fps ts mono/EoF
10 (0) [-] none 10 18800640 B 68.377120 68.378906 31.371 fps ts mono/EoF
11 (1) [-] none 11 18800640 B 68.410439 68.412201 30.013 fps ts mono/EoF
Captured 12 frames in 0.432576 seconds (27.740764 fps, 0.000000 B/s).
5 buffers released.
frame 0: sum 3133440 mean bin   78.15 peak bin   64 | first
frame 1: sum 3133440 mean bin   78.14 peak bin   64 | 132 bins changed, 8952 quads moved
frame 2: sum 3133440 mean bin   78.14 peak bin   64 | 134 bins changed, 10593 quads moved
frame 3: sum 3133440 mean bin   78.17 peak bin   64 | 131 bins changed, 14421 quads moved
frame 4: sum 3133440 mean bin   78.16 peak bin   64 | 135 bins changed, 8599 quads moved
frame 5: sum 3133440 mean bin   78.16 peak bin   64 | 133 bins changed, 6856 quads moved
frame 6: sum 3133440 mean bin   78.16 peak bin   64 | 133 bins changed, 7140 quads moved
frame 7: sum 3133440 mean bin   78.16 peak bin   64 | 130 bins changed, 7601 quads moved
frame 8: sum 3133440 mean bin   78.16 peak bin   64 | 136 bins changed, 7190 quads moved
frame 9: sum 3133440 mean bin   78.17 peak bin   64 | 137 bins changed, 6040 quads moved
➜  tests git:(master) ✗ ./test-params.sh 
>Device /dev/video5 opened.
Device `Qualcomm Camera Subsystem' on `platform:acb6000.isp' (driver 'qcom-camss') supports video, capture, with mplanes.
Video format set: NV12 (3231564e) 4080x3072 field none, 1 planes: 
 * Stride 4080, buffer size 18800640
Video format: NV12 (3231564e) 4080x3072 field none, 1 planes: 
 * Stride 4080, buffer size 18800640
5 buffers requested.
length: 1 offset: 3556493168 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff80432000.
length: 1 offset: 3556493168 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff7f244000.
length: 1 offset: 3556493168 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff7e056000.
length: 1 offset: 3556493168 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff7ce68000.
length: 1 offset: 3556493168 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff7bc7a000.

0 (0) [-] none 0 18800640 B 77.510882 77.513177 15.125 fps ts mono/EoF
<1 (1) [-] none 1 18800640 B 77.543760 77.544648 30.415 fps ts mono/EoF
<2 (2) [-] none 2 18800640 B 77.577316 77.579193 29.801 fps ts mono/EoF
<3 (3) [-] none 3 18800640 B 77.610764 77.612905 29.897 fps ts mono/EoF
<4 (4) [-] none 4 18800640 B 77.644090 77.646387 30.007 fps ts mono/EoF
<<5 (0) [-] none 5 18800640 B 77.677384 77.679966 30.035 fps ts mono/EoF
<6 (1) [-] none 6 18800640 B 77.710689 77.713308 30.026 fps ts mono/EoF
<7 (2) [-] none 7 18800640 B 77.744011 77.746606 30.010 fps ts mono/EoF
<8 (3) [-] none 8 18800640 B 77.777339 77.779922 30.005 fps ts mono/EoF
<
9 (4) [-] none 9 18800640 B 77.810662 77.815188 30.009 fps ts mono/EoF
10 (0) [-] none 10 18800640 B 77.842584 77.844364 31.326 fps ts mono/EoF
11 (1) [-] none 11 18800640 B 77.875909 77.877678 30.008 fps ts mono/EoF
Captured 12 frames in 0.432911 seconds (27.719287 fps, 0.000000 B/s).
5 buffers released.
frame 0: sum 783360 mean bin   74.48 peak bin   65 | first
frame 1: sum 783360 mean bin   74.48 peak bin   65 | 89 bins changed, 3052 quads moved
frame 2: sum 783360 mean bin   74.49 peak bin   65 | 85 bins changed, 2759 quads moved
frame 3: sum 783360 mean bin   74.50 peak bin   65 | 85 bins changed, 4006 quads moved
frame 4: sum 783360 mean bin   74.48 peak bin   65 | 87 bins changed, 4841 quads moved
frame 5: sum 783360 mean bin   74.50 peak bin   65 | 85 bins changed, 4050 quads moved
frame 6: sum 783360 mean bin   74.50 peak bin   65 | 83 bins changed, 2339 quads moved
frame 7: sum 783360 mean bin   74.50 peak bin   65 | 85 bins changed, 2835 quads moved
frame 8: sum 783360 mean bin   74.50 peak bin   65 | 86 bins changed, 2967 quads moved
frame 9: sum 783360 mean bin   74.51 peak bin   65 | 87 bins changed, 3316 quads moved
expected sum 783360
