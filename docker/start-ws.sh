#!/bin/bash
# Get project directory
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/.."

# Build docker image
cd $PROJECT_DIR
docker build -f docker/Dockerfile -t crocoddyl-ws docker

# Run docker container
XAUTH=/tmp/.docker.xauth
docker run -it \
  --gpus all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY=$XAUTH \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/localtime:/etc/localtime:ro" \
  -v "/dev/input:/dev/input" \
  -v "/run/udev:/run/udev" \
  -v "$PROJECT_DIR:/root/code/crocoddyl_ws" \
  --privileged \
  --security-opt seccomp=unconfined \
  --network host \
  --name crocoddyl-ws \
crocoddyl-ws
