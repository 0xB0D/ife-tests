#!/usr/bin/env python3
# Write a V4L2_META_FMT_QCOM_ISP_PARAMS buffer holding one
# CAMSS_PARAMS_AEC_BHIST block: left top width height, in pixels, even.
import struct, sys

CAMSS_PARAMS_AEC_BHIST = 5
V4L2_ISP_PARAMS_FL_BLOCK_ENABLE = 1 << 1

left, top, width, height = (int(v) for v in sys.argv[1:5])
block = struct.pack('<HHI', CAMSS_PARAMS_AEC_BHIST,
                    V4L2_ISP_PARAMS_FL_BLOCK_ENABLE, 16)
block += struct.pack('<HHHH', left, top, width, height)
sys.stdout.buffer.write(struct.pack('<II', 1, len(block)) + block)
