#!/bin/bash
#
# Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA Corporation and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA Corporation is strictly prohibited.
#

# Set locale

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

# Setting up sources

sudo apt-get update && \
sudo apt-get install -y git cmake build-essential curl wget gnupg2 lsb-release 

wget --no-check-certificate https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc && sudo apt-key add ros.asc

sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# install ROS packages
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

sudo apt-get update 
sudo apt-get install -y --no-install-recommends \
		ros-eloquent-ros-base \
		ros-eloquent-launch-xml \
		ros-eloquent-launch-yaml \
		ros-eloquent-rviz2 \
		ros-eloquent-vision-msgs \
                ros-eloquent-image-tools \
		libpython3-dev \
		python3-colcon-common-extensions \
		python3-rosdep \
    && rm -rf /var/lib/apt/lists/*


export ROS_DISTRO=eloquent
export ROS_ROOT=/opt/ros/${ROS_DISTRO}

sudo apt-get update
cd ${ROS_ROOT}
rosdep init
rosdep update

echo 'source /opt/ros/eloquent/setup.bash' >> ${HOME}/.bashrc
