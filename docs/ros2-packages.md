# ROS2 Packages on NVIDIA Jetson

Ease of use and deployment have made the [NVIDIA Jetson platform](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/) a logical choice for developers, researchers, and manufacturers building and deploying robots.

## ROS2: Isaac ROS DNN Inference

[NVIDIA-ISAAC-ROS/isaac\_ros\_dnn\_inference](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_dnn_inference)

This repository provides two NVIDIA GPU-accelerated ROS2 nodes that perform deep learning inference using custom models. One node uses the TensorRT SDK, while the other uses the Triton SDK.

TensorRT is a library that enables faster inference on NVIDIA GPUs; it provides an API for the user to load and execute inference with their own models. The TensorRT ROS2 node in this package integrates this TensorRT API directly, so there is no need to make any calls to or directly use TensorRT SDK. Instead, users simply configure the TensorRT node with their own custom models and parameters, and the node will make the necessary TensorRT API calls to load and execute the model. For further documentation on TensorRT, refer to their main page [here](https://developer.nvidia.com/tensorrt).

Triton is a framework that brings up a generic inference server that a user can configure with a model repository, which is a collection of various types of models (e.g.) ONNX Runtime, TensorRT Engine Plan, TensorFlow, PyTorch). A brief tutorial on how to set up a model repository is included below, and further documentation on Triton is also available at the [Triton GitHub](https://github.com/triton-inference-server/server).


## ROS2: Isaac ROS Visual Odometry

[NVIDIA-ISAAC-ROS/isaac\_ros\_visual\_odometry](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_visual_odometry)

This repository provides a ROS2 package that estimates stereo visual inertial odometry using the [Isaac Elbrus](https://docs.nvidia.com/isaac/isaac/packages/visual_slam/doc/elbrus_visual_slam.html) GPU-accelerated library. It takes in a time synced pair of stereo images (grayscale) along with respective camera intrinsics to publish the current pose of the camera relative to its start pose. This has been tested on ROS2 (Foxy) and should build and run on x86\_64 and aarch64 (Jetson).

## ROS2: Isaac ROS Argus Camera

[NVIDIA-ISAAC-ROS/isaac\_ros\_argus\_camera](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_argus_camera)

This repository provides monocular and stereo nodes that enable ROS developers to use cameras connected to Jetson platforms over a CSI interface. The nodes internally use libargus, which is an API for acquiring images and associated metadata from camera devices.

[Libargus API reference](https://docs.nvidia.com/jetson/l4t-multimedia/group__LibargusAPI.html)

This package is compatible with ROS2 Foxy and has been tested on the Jetson platfrom with off-the-shelf cameras from NVIDIA partners(see the Reference Camera section for more details). Note: x86\_64 is not supported.

## ROS2: Isaac ROS image\_pipeline

[NVIDIA-ISAAC-ROS/isaac-ros-image-pipeline](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_image_pipeline)

This metapackage offers similar functionality as the standard, CPU-based [image\_pipeline metapackage](http://wiki.ros.org/image_pipeline), but does so by leveraging the Jetson platform's specialized computer vision hardware. Considerable effort has been made to ensure that replacing image\_pipeline with isaac\_ros\_image\_pipeline on a Jetson device is as painless a transition as possible.

## ROS2: Isaac ROS Common

[NVIDIA-ISAAC-ROS/isaac-ros-common](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_common)

Isaac ROS common utilities for use in conjunction with the Isaac ROS suite of packages. <br/>
Note: Please refer to scripts/README.md for script used to setup dev environment.


## ROS2 Package for Accelerated AprilTags 

[NVIDIA-ISAAC-ROS/ros2-nvapriltags GitHub Link](https://github.com/NVIDIA-ISAAC-ROS/ros2-nvapriltags)

AprilTags is a common fiducial tag that makes it easy to derive its 6DOF pose of in a scene with only a monocular camera. These tags are used in a variety of applications in robotics such as object tracking and visual localization. The faster one can detect the pose of a tag, the faster the closed loop can be for more responsive behaviors. Native ROS2 package wraps NVIDIA's GPU-accelerated AprilTag detector for fast detection of the 36h11 tag family published as a standard TF topic.

The underlying NVAprilTag library is still in development, so please validate its performance for your use cases. Feedback is appreciated.

ROS2 node uses the NVIDIA GPU-accelerated AprilTags library to detect AprilTags in images and publish their poses, ids, and additional metadata. This has been tested on ROS2 (Foxy) and should run on x86_64 and aarch64 (Jetson hardware). It is modeled after and comparable to the ROS2 node for [CPU AprilTags detection](https://github.com/christianrauch/apriltag_ros.git)

For more information on the Isaac GEM this node is based off of, see the [Isaac SDK 2020.2 documentation](https://docs.nvidia.com/isaac/isaac/packages/fiducials/doc/apriltags.html)

For more information on AprilTags themselves, the paper and the reference CPU implementation: please check [UMICH Apriltag](https://april.eecs.umich.edu/software/apriltag.html)

## ROS2 Package for Human Hand Pose Estimation

The `ros2_trt_pose_hand` package is implemented based on `trt_pose_hand`, which implements a real-time hand pose estimation and gesture classification using TensorRT.

[ NVIDIA-AI-IOT/ros2-trt-pose-hand GitHub Link](https://github.com/NVIDIA-AI-IOT/ros2_trt_pose_hand)

Here are the key features of the `ros2_trt_pose_hand` package:

* Hand Pose message with 21 key-points
* Hand Pose detection image message
* `std_msgs` for gesture classification with 6 classes [fist, pan, stop, fine, peace, no hand]
* Visualization markers
* Launch file for RViz

## ROS2 Package for Human Pose Estimation

The `ros2_trt_pose` package is implemented based on `trt_pose`, which enables pose estimation on the Jetson platform. The repository provides two trained models for pose estimation using resnet18 and densenet121. To understand human pose, pretrained models infer 17 body parts based on the categories from the COCO dataset.

[ NVIDIA-AI-IOT/ros2-trt-pose GitHub Link](https://github.com/NVIDIA-AI-IOT/ros2_trt_pose)

Here are the key features of the `ros2_trt_pose` package:

* Publishes `pose_msgs` such as count of person and `person_id`. For each `person_id`, it publishes 17 body parts.
* Provides launch file for easy usage and visualizations on Rviz2:
** Image messages
** Visual markers: `body_joints`, `body_skeleton`
* Contains a Jetson-based Docker image for easy install and usage

## ROS2 Package for PyTorch and NVIDIA TensorRT

There are two packages for classification and detection using PyTorch, each with their corresponding TRT versions implemented. These four packages are a good starting point for roboticists using ROS 2 to get started with deep learning using PyTorch.

TensorRT has been integrated into the packages with the help of torch2trt for accelerated inference. It generates a runtime engine which is optimized according to the architecture of the network and the deployment device.   

[NVIDIA-AI-IOT/ros2-torch-trt GitHub Link](https://github.com/NVIDIA-AI-IOT/ros2_torch_trt)

The main features of the packages are as follows:

* For classification, you can select from various ImageNet pretrained models, including Resnet18, AlexNet, SqueezeNet, and Resnet50.
* For detection, MobileNetV1-based SSD is currently supported, trained on the COCO dataset.
* The TRT packages provide a significant speedup in carrying out inference relative to the PyTorch models performing inference directly on the GPU.
* The inference results are published in the form of `vision_msgs`.
* On running the node, a window is also shown with the inference results visualized.
* A Jetson-based Docker image and launch file is provided for ease of use

## ROS 2 Package for DeepStream SDK

The DeepStream SDK delivers a complete streaming analytics toolkit to build end-to-end AI-based solutions using multi-sensor processing, video, and image understanding. It offers support for popular object detection and segmentation models such as state of the art SSD, YOLO, FasterRCNN, and MaskRCNN.

[NVIDIA-AI-IOT/ros2-deepstream GitHub Link](https://github.com/NVIDIA-AI-IOT/ros2_deepstream)

NVIDIA provide ROS 2 nodes that perform two inference tasks based on the DeepStream Python Apps project as follows:

* Object detection: Four classes of objects are detected: Vehicle, Person, RoadSign, and TwoWheeler.
* Attribute classification: Three types of attributes are classified for objects of class Vehicle: Color, Make, and Type.

These publisher nodes take single or multiple video streams as input from camera or file. They perform inference and publish results of detection and classification to different topics. We also provide sample ROS 2 subscriber nodes that subscribe to these topics and display results in `vision_msgs` format. Each inference task also spawns a visualization window with bounding boxes and labels around detected objects. Additional inference tasks and custom models can be integrated with the DeepStream pipeline provided in this project.

## ROS2 Package for Jetson Stats

The `ros2_jetson_stats` package is a community build package that monitors and controls your Jetson device. It can run on your terminal and provides a Python package for easy integration in Python scripts. Take advantage of the `ros2_jetson_stats` library and build ROS 2 diagnostic messages and services.

[NVIDIA-AI-IOT/ros2-jetson-stats GitHub Link](https://github.com/NVIDIA-AI-IOT/ros2_jetson_stats)

The `ros2_jetson_stats` package features the following ROS 2 diagnostic messages:

* GPU/CPU usage percentage
* EMC/SWAP/Memory status (% usage)
* Power and temperature of SoC

You can now control the following through the ROS 2 command line:

* Fan (Mode and Speed)
* Power model (nvpmodel)
* `jetson_clocks`
You can also provide a parameter to set the frequency of reading diagnostic messages.

## Deep Learning Nodes for ROS/ROS2

This repo contains deep learning inference nodes and camera/video streaming nodes for ROS/ROS2 with support for Jetson Nano/TX1/TX2/Xavier NX/AGX Xavier and TensorRT.

[GitHub Link](https://github.com/dusty-nv/ros_deep_learning)

The nodes use the image recognition, object detection, and semantic segmentation DNN's from the `jetson-inference` library and [NVIDIA Hello AI World](https://developer.nvidia.com/embedded/twodaystoademo) tutorial, which come with several built-in pretrained networks for classification, detection, and segmentation and the ability to load customized user-trained models.

The camera/video streaming nodes support the following input/output interfaces:

* MIPI CSI cameras
* V4L2 cameras
* RTP / RTSP
* Videos & Images
* Image sequences
* OpenGL windows

ROS Melodic and ROS2 Eloquent are supported, and the latest version of JetPack is recommended.

![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)

