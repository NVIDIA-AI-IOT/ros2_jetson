#!/usr/bin/env bash

set -e

if [ "$#" -ne 2 ]; then
    echo "Use Script as : sh docker_build.sh eloquent l4tbase"
    exit
fi

ROS_DISTRO=$1
BASE_IMAGE=$2

JP_release=r32.5
DS_release=5.0.1
echo $BASE_IMAGE

if [ "$BASE_IMAGE" = "deepstream" ]; then
	if [ "$ROS_DISTRO" = "foxy" ] || [ "$ROS_DISTRO" = "eloquent" ]; then
    ROS_VERSION=ros2
  else
    ROS_VERSION=ros
  fi
	sudo docker build -t deepstream-$ROS_VERSION-$ROS_DISTRO:$DS_release -f DockerFile.$BASE_IMAGE.ROS.$ROS_DISTRO .
elif [ "$BASE_IMAGE" = "l4tbase" ]; then
  if [ "$ROS_DISTRO" = "foxy" ] || [ "$ROS_DISTRO" = "eloquent" ]; then
    ROS_VERSION=ros2
  else
    ROS_VERSION=ros
  fi
	sudo docker build -t l4t-$ROS_VERSION-$ROS_DISTRO-pytorch:$JP_release -f DockerFile.$BASE_IMAGE.ROS.$ROS_DISTRO .
else
	echo "2nd Arguement needs to be deepstream or l4tbase"
fi
