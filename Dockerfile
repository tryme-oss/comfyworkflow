# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail lanpaint@1.5.3 --mode remote
RUN comfy node install --exit-on-fail cg-use-everywhere@7.8.0
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2604070017
# Could not resolve unknown_registry/MarkdownNote: no aux_id (GitHub repo) provided, skipping clone

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors
# RUN # Could not find URL for qwen_3_8b_fp4mixed.safetensors
# RUN # Could not find URL for flux-2-klein-9b-fp8.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
