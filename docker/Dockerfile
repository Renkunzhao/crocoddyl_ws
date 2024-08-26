# 基于ros-noetic的Ubuntu 20.04镜像
FROM osrf/ros:noetic-desktop-full

# 关闭交互
ENV DEBIAN_FRONTEND=noninteractive

    # 换源
RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
    sed -i "s@http://.*security.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
    apt update && \
    # 管理软件源、GPG秘钥、APT开启https下载、CA证书
    apt install -y lsb-release software-properties-common gnupg2 apt-transport-https ca-certificates python3-pip && \
    # 常用网络包
    apt install -y iputils-ping iproute2 wget curl && \
    # 构建工具、代码管理、数学库、空间管理
    apt install -y build-essential cmake git vim gdb libboost-all-dev libeigen3-dev ncdu

    # 安装工程依赖
    # rviz/ros 可视化依赖
RUN apt install -y gnome-terminal dbus-x11 && \
    apt install -y libglpk-dev libgmp-dev libmpfr-dev ros-noetic-pybind11-catkin python3-catkin-tools && \
    apt install -y ros-noetic-rqt-multiplot && \
    apt install -y rsync python3-venv

    # crocoddyl dependencies
RUN apt install -y libopenthreads-dev libopenscenegraph-dev libomniorb4-dev qt5-default python3-tk

    # 工具
    # 合并compile_commands.json文件
RUN apt install -y jq && \
    # 格式化代码
    apt install -y clang-format

CMD ["bash"]

