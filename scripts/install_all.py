import argparse
import os
import subprocess

class install_argparse():
    def __init__(self):
        self.parser = argparse.ArgumentParser(description='ros related scripts')
        dep_group = self.parser.add_mutually_exclusive_group()
        dep_group.add_argument('--all', dest='all', help='OpenCV, PyTorch, and ROS will be installed', action='store_true')
        dep_group.add_argument('--pytorch', dest='pytorch', help=' PyTorch will be installed', action='store_true')
        dep_group.add_argument('--opencv', dest='opencv', help='OpenCV will be installed', action='store_true')
        self.parser.add_argument('--ros', dest='ros', help='Provide ros distribution', type=str)
    def make_args(self):
        return self.parser.parse_args()


def main():
    arg_parser = install_argparse()
    args = arg_parser.make_args()
    if args.all:
        print("Installing OpenCV with CUDA Support")
        subprocess.call( 'sudo {}'.format('./install_opencv4.5.0_Jetson.sh'), shell=True)
        print("Installing PyTorch")
        subprocess.call( 'sudo {}'.format('./install_pytorch_l4t.sh'), shell=True)
    if args.pytorch:
        print("Installing PyTorch")
        subprocess.call( 'sudo {}'.format('./install_pytorch_l4t.sh'), shell=True)
    if args.opencv:
        print("Installing OpenCV with CUDA Support")
        subprocess.call( 'sudo {}'.format('./install_opencv4.5.0_Jetson.sh'), shell=True)
    if args.ros == "eloquent":
        print("Installing ROS Eloquent")
        subprocess.call( 'sudo {}'.format('./install_ros2_eloquent.sh'), shell=True)
    if args.ros == "foxy":
        print("Installing ROS2 Foxy")
        subprocess.call( 'sudo {}'.format('./install_ros2_foxy.sh'), shell=True)



if __name__ == "__main__":
    main()

