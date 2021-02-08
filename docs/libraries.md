# ROS / ROS2 supported libraries on NVIDIA Jetson

## cuda-pcl : CUDA Accelerated PointCloud Library on Jetson
Many Jetson users choose lidar for positioning and sensing in automation solutions. Lidar uses a 3D point cloud to depict the surrounding space environment. The point cloud can sample the surface information of the object with high precision and long distance to facilitate the obstacle perception, mapping, positioning and path planning algorithms of the upper application.

[NVIDIA-AI-IOT/cuda-pcl GitHub Link](https://github.com/NVIDIA-AI-IOT/cuda-pcl)

`cuda-pcl` has some libraries used to process points cloud with CUDA and some samples for their usage. The are several subfolders in the project and every subfolder has:
* lib for segmentation implemented by CUDA
* Sample code can show the lib usage and also be used to check perf and accuracy by comparing its output with PCL

![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)

