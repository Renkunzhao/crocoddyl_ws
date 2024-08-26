#!/bin/bash

# Get project directory
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/.."

# Install dependencies
pip install matplotlib
pip install scipy
pip install meshcat

# Clone repositories
mkdir -p $PROJECT_DIR/src
cd $PROJECT_DIR/src
git clone --recursive https://github.com/loco-3d/crocoddyl.git
git clone --recursive https://github.com/stack-of-tasks/pinocchio.git
git clone --recursive https://github.com/stack-of-tasks/eigenpy.git
git clone --recursive https://github.com/Gepetto/example-robot-data.git
# git clone --recursive https://github.com/Gepetto/gepetto-viewer.git
# git clone --recursive https://github.com/Gepetto/gepetto-viewer-corba.git
git clone --recursive https://github.com/loco-3d/whole_body_state_msgs.git
git clone --recursive https://github.com/loco-3d/whole_body_state_rviz_plugin.git
git clone --recursive https://github.com/RobotMotorIntelligence/crocoddyl_msgs.git
git clone --recursive https://github.com/ros/urdf_parser_py.git

# Build
cd $PROJECT_DIR 
catkin build -c # gepetto-viewer will probably failed

# Add python package to PYTHONPATH
# echo "export PYTHONPATH=/root/code/crocoddyl_ws/devel/lib/python3.8/site-packages:$PYTHONPATH" >> ~/.bashrc