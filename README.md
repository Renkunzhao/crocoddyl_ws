# Description
- This repository provide Dockerfile and scripts to build crocoddyl from source easily
- Click to watch the video

[![Example GIF](./bipedal_walk_invdyn.gif)](https://www.youtube.com/watch?v=IrcCegoCYzk)

# Build & run docker container 
```bash
./scripts/start-ws.sh
```

# Build crocoddyl
```bash
# run in container
cd /root/code/crocoddyl_ws
./scripts/crocoddyl-build.sh
export PYTHONPATH=/root/code/crocoddyl_ws/devel/lib/python3.8/site-packages:$PYTHONPATH
export CROCODDYL_DISPLAY=1
export CROCODDYL_PLOT=1
python3 src/crocoddyl/examples/bipedal_walk_invdyn.py 
```

# Install crocoddyl with conda (Optional)
- This may conflict with the crocoddyl build from source.
- Recommaned if you only need to use crocoddyl.
```bash
cd <crocoddyl-ws>/scripts
wget -N https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b
~/miniconda3/bin/conda init
source ~/.bashrc
conda create -y -n crocoddyl_ws python=3.12
conda activate crocoddyl_ws
conda install -y -c conda-forge crocoddyl cppadcodegen gepetto-viewer-corba meshcat-python matplotlib
```

# Issue
1. gepetto-viewer、gepetto-viewer-corba can't build successfully
