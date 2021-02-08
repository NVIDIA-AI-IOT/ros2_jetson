# ROS2 Docker Containers for NVIDIA Jetson

[dusty-nv/jetson-containers GitHub Link](https://github.com/dusty-nv/jetson-containers)

To easily run different versions of ROS 2 on Jetson, NVIDIA has released various Dockerfiles and build scripts for ROS 2 Eloquent and Foxy, in addition to ROS Melodic and Noetic. These containers provide an automated and reliable way to install ROS or ROS 2 on Jetson and build your own ROS-based applications.

Because Eloquent and Melodic already provide prebuilt packages for Ubuntu 18.04, these versions of ROS are installed into the containers by the Dockerfiles. On the other hand, Foxy and Noetic are built from a source inside the container as those versions only come prebuilt for Ubuntu 20.04. With the containers, using these versions of ROS or ROS 2 is the same, regardless of the underlying OS distribution.

![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)

