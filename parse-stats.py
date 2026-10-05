#!/usr/bin/env python3
# Walk V4L2_META_FMT_QCOM_ISP_STATS buffers appended by v4l2-ctl --stream-to.
#
# The histogram sum is the number of 2x2 quads counted, constant for a fixed
# region. What moves with the scene is the distribution: watch the mean bin,
# and how many bins changed since the previous frame.
import struct, sys

CAMSS_STATS_AEC_BHIST = 1
data = open(sys.argv[1], 'rb').read()
off, frame, prev = 0, 0, None
while off + 8 <= len(data):
    version, data_size = struct.unpack_from('<II', data, off)
    if off + 8 + data_size > len(data):
        print(f"frame {frame}: truncated ({len(data) - off - 8} of {data_size} bytes)")
        break
    blocks, pos = data[off + 8: off + 8 + data_size], 0
    while pos + 8 <= len(blocks):
        btype, flags, bsize = struct.unpack_from('<HHI', blocks, pos)
        if btype == CAMSS_STATS_AEC_BHIST:
            bins = struct.unpack_from('<1024I', blocks, pos + 8)
            total = sum(bins)
            mean = sum(i * b for i, b in enumerate(bins)) / total if total else 0
            if prev is None:
                delta = "first"
            else:
                changed = sum(1 for a, b in zip(bins, prev) if a != b)
                moved = sum(abs(a - b) for a, b in zip(bins, prev)) // 2
                delta = f"{changed} bins changed, {moved} quads moved"
            print(f"frame {frame}: sum {total} mean bin {mean:7.2f} "
                  f"peak bin {bins.index(max(bins)):4d} | {delta}")
            prev = bins
        else:
            print(f"frame {frame}: block type {btype} size {bsize} (skipped)")
        pos += bsize
    off += 8 + data_size
    frame += 1
