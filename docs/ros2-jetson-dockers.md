# ROS2 Docker Containers for NVIDIA Jetson

## Docker Containers for ROS/ROS2 
[GitHub Link](https://github.com/NVIDIA-AI-IOT/ros2_jetson/tree/main/docker)

This repository is created for ROS Noetic and ROS2 Foxy / Eloquent containers for NVIDIA Jetson platform based on [ROS2 Installation Guide](https://index.ros.org/doc/ros2/Installation/), [ROS Noetic Installing from Source](http://wiki.ros.org/noetic/Installation/Source), and [dusty-nv/jetson-containers](https://github.com/dusty-nv/jetson-containers)

This repository supports following docker images:

- ROS2 Eloquent / Foxy, and ROS Noetic with PyTorch and TensorRT <br/>
     - DL Libraries: PyTorch, NVIDIA TensorRT  <br/>
     - ML Libraries: scikit-learn, numpy etc  <br/>
     - Cuda Acceleration Library: pyCUDA <br/>
     - Widely used developer repositories: torch2trt, trt_pose
     - ROS2 Packages: (Foxy packages will be updated soon)
        - [NVIDIA-AI-IOT/ros2_trt_pose](https://github.com/NVIDIA-AI-IOT/ros2_trt_pose) <br/>
        - [NVIDIA-AI-IOT/ros2_trt_pose_hand](https://github.com/NVIDIA-AI-IOT/ros2_trt_pose_hand) <br/>
- ROS2 Eloquent / Foxy with DeepStream SDK <br/>
     - NVIDIA DeepStream SDK for Classification, Object detection <br/>
     - ROS2 packages: (Foxy packages will be updated soon)
        - [NVIDIA-AI-IOT/ros2_deepstream](https://github.com/NVIDIA-AI-IOT/ros2_deepstream) <br/>
        - ```vision_msgs```

[Pull Docker Images](https://github.com/NVIDIA-AI-IOT/ros2_jetson/tree/main/docker#pull-docker-images-from-docker-hub-follow)

## DockerFiles for ROS/ROS2, ML Libraries

[dusty-nv/jetson-containers GitHub Link](https://github.com/dusty-nv/jetson-containers)

To easily run different versions of ROS 2 on Jetson, NVIDIA has released various Dockerfiles and build scripts for ROS 2 Eloquent and Foxy, in addition to ROS Melodic and Noetic. These containers provide an automated and reliable way to install ROS or ROS 2 on Jetson and build your own ROS-based applications.

Because Eloquent and Melodic already provide prebuilt packages for Ubuntu 18.04, these versions of ROS are installed into the containers by the Dockerfiles. On the other hand, Foxy and Noetic are built from a source inside the container as those versions only come prebuilt for Ubuntu 20.04. With the containers, using these versions of ROS or ROS 2 is the same, regardless of the underlying OS distribution.

![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)

