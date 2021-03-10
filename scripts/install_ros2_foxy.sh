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
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
                        libbullet-dev \
                        libpython3-dev \
                        python3-colcon-common-extensions \
                        python3-flake8 \
                        python3-pip \
                        python3-pytest-cov \
                        python3-rosdep \
                        python3-setuptools \
                        python3-vcstool \
                        python3-rosinstall-generator \
                        libasio-dev \
                        libtinyxml2-dev \
                        libcunit1-dev \
                        && rm -rf /var/lib/apt/lists/*

python3 -m pip install -U \
            argcomplete \
            flake8-blind-except \
            flake8-builtins \
            flake8-class-newline \
            flake8-comprehensions \
            flake8-deprecated \
            flake8-docstrings \
            flake8-import-order \
            flake8-quotes \
            pytest-repeat \
            pytest-rerunfailures \
            pytest

export ROS_DISTRO=foxy
export ROS_ROOT=/opt/ros/${ROS_DISTRO}

sudo apt-get update

# https://answers.ros.org/question/325245/minimal-ros2-installation/?answer=325249#post-id-325249
sudo mkdir -p ${ROS_ROOT}/src && \
    cd ${ROS_ROOT} && \
    rosinstall_generator --deps --rosdistro ${ROS_DISTRO} ${ROS_PKG} launch_xml launch_yaml example_interfaces > ros2.${ROS_DISTRO}.${ROS_PKG}.rosinstall && \
    cat ros2.${ROS_DISTRO}.${ROS_PKG}.rosinstall && \
    vcs import src < ros2.${ROS_DISTRO}.${ROS_PKG}.rosinstall

sudo apt-get update
cd ${ROS_ROOT} && rosdep init && rosdep update && \
    rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y --skip-keys "" && \
    rm -rf /var/lib/apt/lists/*

# Fix libyaml_vendor package issue

#sudo rm ${ROS_ROOT}/src/libyaml_vendor/CMakeList* && \
#sudo wget --no-check-certificate https://raw.githubusercontent.com/ros2/libyaml_vendor/master/CMakeLists.txt -P ${ROS_ROOT}/src/libyaml_vendor/

# build it!
cd ${ROS_ROOT} && colcon build --symlink-install

echo 'source /opt/ros/foxy/install/setup.bash' >> ${HOME}/.bashrc
