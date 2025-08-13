# ROS2 Humble – TurtleSim Robot Controller

## 📖 Overview
This project implements a **2D robot controller** in the **TurtleSim** environment using **ROS2 Humble**.  
The goal was to create **a single Python object-oriented node** that:
- Publishes velocity commands (`cmd_vel`) to control the turtle’s linear and angular motion.
- Subscribes to the turtle’s pose topic (`/turtle1/pose`) to retrieve its position and orientation in real time.

---

## 🛠 Technologies
- **ROS2 Humble**
- **Python 3**
- **rclpy** (ROS2 Python client library)
- **TurtleSim**

---

## 📂 Project Structure


---

## 🚀 Setup & Run

### 1️⃣ Set up ROS2 environment
Make sure ROS2 Humble is installed and sourced:
```bash
source /opt/ros/humble/setup.bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>

colcon build
source install/setup.bash
ros2 run turtlesim turtlesim_node
ros2 run my_robot_controller controller



