#!/bin/bash
# 1.3 DDP on 8 H100 GPUs — B=64, T=1024, bfloat16 + compile + flash attention + DDP
nebius ai job create \
    --name ex1-3-bary \
    --image cr.eu-north1.nebius.cloud/e00v1er5fasm8gmdwy/apex-ex-1 \
    --container-command bash \
    --args '-c "git clone -b bary-testing https://github.com/Apex-IL/architects-ex-1.git && cd architects-ex-1 && torchrun --standalone --nproc_per_node=8 solution_1_3.py"' \
    --platform gpu-h100-sxm \
    --preset 8gpu-128vcpu-1600gb \
    --timeout 30m \
    --volume computefilesystem-e00hnnpfn5rr5aavma:/mnt/data \
    --volume computefilesystem-e00yzm564mmdvedbsj:/mnt/models
