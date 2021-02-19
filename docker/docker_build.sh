#!/usr/bin/env bash

set -e

if [ "$#" -ne 2 ]; then
    echo "Use Script as : sh docker_build.sh eloquent l4tbase"
    exit
fi

ROS2_DISTRO=$1
BASE_IMAGE=$2

JP_release=l4t-r32.5
DS_release=deepstream-5.0.1
echo $BASE_IMAGE

if [ "$BASE_IMAGE" = "deepstream" ]; then
	sudo docker build -t ros2_$ROS2_DISTRO:$DS_release -f DockerFile.$BASE_IMAGE.ROS2.$ROS2_DISTRO .
elif [ "$BASE_IMAGE" = "l4tbase" ]; then
	sudo docker build -t ros2_$ROS2_DISTRO:$JP_release -f DockerFile.$BASE_IMAGE.ROS2.$ROS2_DISTRO .
else
	echo "2nd Arguement needs to be deepstream or l4tbase"
fi
