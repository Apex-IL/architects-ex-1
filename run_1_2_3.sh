#!/bin/bash
# 1.2.3 torch.compile — B=16, T=1024, bfloat16 + compile
# note: first step is slow due to compilation (~1-2 min), subsequent steps are faster
nebius ai job create \
    --name ex1-2-3-bary \
    --image cr.eu-north1.nebius.cloud/e00v1er5fasm8gmdwy/apex-ex-1 \
    --container-command bash \
    --args '-c "git clone -b bary-testing https://github.com/Apex-IL/architects-ex-1.git && cd architects-ex-1 && python solution_1_2_3.py"' \
    --platform gpu-l40s-d \
    --preset 1gpu-16vcpu-96gb \
    --timeout 20m \
    --volume computefilesystem-e00hnnpfn5rr5aavma:/mnt/data
