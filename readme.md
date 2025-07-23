# ROBOTIS OP3 Manifest

This repository will clone all the repos and setup the OP3 ROS2 workspace. Create an
empty ros2 workspace with a `src` folder, clone the repo and then run the setup
script.

```bash
mkdir -p robotis_ws/src
cd $_
git clone https://github.com/blueshrapnel/op3-meta.git 
cd ..
./src/op3-meta/setup.sh
```

## Requirements

In recent vcstool releases, pkg_resources is deprecated as an API.  Update vcstool to
remove warnings.

```bash
python3 -m pip install --upgrade --user vcstool  
```

Some of the packages require `catkin_pkg`.

```bash
python3 -m pip install catkin_pkg
```

## Dependencies

We can use `rosdep` to install system level dependencies.
```bash
sudo apt update
sudo apt install python3-rosdep

# initialize rosdep and update the rosdep database
sudo rosdep init
rosdep udpate

rosdep install --from-paths src --ignore-src -r -y --os=ubuntu:noble

```

Rosdep will install the packages in the system site packages. If the Python that builds the workspace is pyenv’s interpreter
(/home/$USER/.pyenv/shims/python3), then pyenv interpreter can’t see them.  So some
may need to be installed separately.

```bash
python3 -m pip install empy lark-parser
```

