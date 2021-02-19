This repository is created for ROS2 containers for NVIDIA Jetson platform based on [ROS2 Installation Guide](https://index.ros.org/doc/ros2/Installation/) and [dusty-nv/jetson-containers](https://github.com/dusty-nv/jetson-containers)

NVIDIA Jetson provided various AI application ROS2 packages, please [find here more information](https://nvidia-ai-iot.github.io/ros2_jetson/)

This repository supports following docker images:

- ROS2 Eloquent / Foxy with PyTorch and TensorRT <br/>
     - DL Libraries: PyTorch, NVIDIA TensorRT  <br/>
     - ML Libraries: scikit-learn, numpy etc  <br/>
     - Widely used developer repositories: torch2trt, trt_pose
     - ROS2 Packages: (Foxy packages will be updated soon)
        - [NVIDIA-AI-IOT/ros2_trt_pose](https://github.com/NVIDIA-AI-IOT/ros2_trt_pose) <br/>
        - [NVIDIA-AI-IOT/ros2_trt_pose_hand](https://github.com/NVIDIA-AI-IOT/ros2_trt_pose_hand) <br/>
- ROS2 Eloquent / Foxy with DeepStream SDK <br/>
     - NVIDIA DeepStream SDK for Classification, Object detection <br/>
     - ROS2 packages: (Foxy packages will be updated soon)
        - [NVIDIA-AI-IOT/ros2_deepstream](https://github.com/NVIDIA-AI-IOT/ros2_deepstream) <br/>
        - ```vision_msgs```

## Pull docker images from Docker Hub follow:
- ROS2 Eloquent with PyTorch and TensorRT <br/>
  ``` docker pull nvidiajetson/l4t-ros2-eloquent-pytorch:r32.5 ```
- ROS2 Eloquent with DeepStream SDK <br/>
  ``` docker pull nvidiajetson/deepstream-ros2-eloquent-pytorch:5.0.1 ```
- ROS2 Foxy with PyTorch and TensorRT <br/>
  ``` docker pull nvidiajetson/l4t-ros2-foxy-pytorch:r32.5 ```
- ROS2 Foxy with DeepStream SDK <br/>
  ``` docker pull nvidiajetson/deepstream-ros2-foxy-pytorch:5.0.1 ```

## Build docker images using DockerFiles:

1. Enable Docker Default Runtime: <br/>
   - Add ```"default-runtime": "nvidia" ``` to your ```/etc/docker/daemon.json```
   ``` $ vi /etc/docker/daemon.json```
   ``` 
      {
        "runtimes": {
            "nvidia": {
                "path": "nvidia-container-runtime",
                "runtimeArgs": []
             }
        },

        "default-runtime": "nvidia"
      }
    - Restart docker or Reboot system
    ``` $ sudo systemctl restart docker ``` <br/>

2. Copy file needed for CV2 library installation <br/>
   ``` $ cp /etc/apt/trusted.gpg.d/jetson-ota-public.asc . ```

3. Build Container <br/>
   - ROS2 Eloquent with PyTorch and TensorRT
     ``` sh docker_build.sh eloquent l4tbase ```
   - ROS2 Eloquent with DeepStream SDK
     ``` sh docker_build.sh eloquent deepstream ```
   - ROS2 Foxy with PyTorch and TensorRT
     ``` sh docker_build.sh foxy l4tbase ```
   - ROS2 Foxy with DeepStream SDK
     ``` sh docker_build.sh foxy deepstream ```
