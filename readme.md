# ROBOTIS OP3 Manifest

This repository will clone all the repos and setup the OP3 ROS2 workspace. Create an
empty ros2 workspace with a `src` folder, clone the repo and then run the setup
script.

## Preliminaries

### ROS2 and CycloneDDS

You should ensure that you have a complete ROS Jazzy installation using rmw
cyclonedds, set an environment variable `RMW_IMPLEMENTATION` in your bashrc.  You can
check your ROS2 installation using `ros2 doctor` as shown below.

```bash
sudo apt install ros-jazzy-rmw-cyclonedds_cpp
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp  # add this to your .bashrc
source /opt/ros/jazzy/setup.sh
ros2 doctor --report
```

### System python

You should pyenv or venv for building ROS packages, so if you have pyenv installed
deactivate it with:

```bash
pyenv global system
# check that you are not using a shim or virtual python environment
which python3
```

## Run Setup Script

When you have checked ROS and python, then create a workspace folder and run the
setup script.   This will update and install the required tools, run `rosdep` to
install the package dependencies.  

```bash
mkdir -p robotis_ws/src
cd $_
git clone https://github.com/blueshrapnel/op3-meta.git 
cd ..
./src/op3-meta/setup.sh
```

## Webots Simulator

To launch the robot in webots:

```bash
sudo apt-get install ros-jazzy-webots-ros2
ros2 launch op3_webots_ros2 robot_launch.py

```

## Web Sockets
Later if we want to create web dashboards, then we would need to install the
websocket ROS bridge.

```bash
sudo apt install ros-jazzy-rosbridge-server
ros2 launch rosbridge_server rosbridge_websocket_launch.xml
```
