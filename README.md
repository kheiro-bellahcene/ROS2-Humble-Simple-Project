
# ROS2 Humble – TurtleSim Robot Controller

## 📖 Overview
This project implements a **2D robot controller** in the **TurtleSim** environment using **ROS2 Humble**.  
It was my **first small demo** during my 2024 internship search.  
The goal was to create **a single Python object-oriented node** that:  
- Publishes velocity commands (`cmd_vel`) to control the turtle’s linear and angular motion.  
- Subscribes to the turtle’s pose topic (`/turtle1/pose`) to retrieve its position and orientation in real time.

---
## 🚀 Demo
Here is a short GIF demonstrating the turtle’s movement (my first hands-on demo):

![TurtleSim Demo](gif-demo/output.gif)

---

## 🛠 Tools
- **ROS2 Humble**
- **Python 3**
- **rclpy** (ROS2 Python client library)
- **TurtleSim**

---


## 🏗 Setup & Run

### Download and Run the project
Make sure ROS2 Humble is installed:
### Download
```bash
git clone https://github.com/kheiro-bellahcene/ROS2-Humble-Simple-Project.git
cd ROS2-Humble-Simple-Project
```

### Run
#### Option 1: Make it executable and run it
```bash
chmod +x setup_ros2_humble.sh
./setup_ros2_humble.sh
```
#### Option 2: Run it directly with bash (no chmod needed)
```bash
bash setup_ros2_humble.sh
```
