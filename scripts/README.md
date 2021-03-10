This part of the repository provides easy install scripts for ROS2 accompanied by CUDA Accelerated OpenCV, and PyTorch. <br/>

To Install all libraries with ROS2 Foxy / Eloquent:
``` $ python3 install_all.py --all --ros <ros_distro> ```

To install individual components:
- PyTorch v1.7 and TorchVision v0.8.1 (find updated wheels [here](https://forums.developer.nvidia.com/t/pytorch-for-jetson-version-1-8-0-now-available/72048)) <br/>
    ``` python3 install_all.py --pytorch```
- Cuda supported OpenCV (find updated repository [AastaNV/JEP](https://github.com/AastaNV/JEP/blob/master/script/install_opencv4.5.0_Jetson.sh))<br/>
    ``` python3 install_all.py --opencv```