#!/usr/bin/env bash
#
# ROBOTIS OP3 workspace bootstrapper
# ----------------------------------
# • Clones all repos listed in src/op3_bringup/op3.repos
# • Ensures Python vcstool + catkin_pkg are present
# • Installs system‑level dependencies via rosdep
# • Leaves the workspace ready for `colcon build --symlink-install`
#
set -e  # bail out on first error

echo -e "\e[1;34m[OP3 SETUP] Cloning ROBOTIS OP3 repositories …\e[0m"
vcs import --recursive src < src/op3-meta/op3.repos
vcs pull src  # later updates

echo -e "\e[1;34m[OP3 SETUP] Installing/upgrading vcstool, catkin_pkg, etc …\e[0m"
python3 -m pip install --upgrade --user vcstool catkin_pkg
python3 -m pip install empy lark-parser

echo -e "\e[1;34m[OP3 SETUP] Installing rosdep and refreshing its database …\e[0m"
sudo apt update
sudo apt install -y python3-rosdep

# First‑time rosdep initialisation (idempotent)
if ! sudo test -f /etc/ros/rosdep/sources.list.d/20-default.list; then
    echo -e "\e[1;34m[OP3 SETUP] Initialising rosdep for the first time …\e[0m"
    sudo rosdep init
fi
rosdep update

echo -e "\e[1;34m[OP3 SETUP] Resolving and installing system dependencies …\e[0m"
rosdep install --from-paths src --ignore-src -r -y --os=ubuntu:noble

echo -e "\e[1;32m[OP3 SETUP] All done!  You can now run:\e[0m"
echo -e "    source /opt/ros/jazzy/setup.bash"
echo -e "    colcon build --symlink-install"

