#!/bin/bash
# setup_ros2.sh
# Script pour configurer rapidement le workspace ROS2 Humble pour le projet TurtleSim

# ----------------------------------------
# 1️⃣ Ajouter ROS2 Humble à ~/.bashrc si nécessaire
# ----------------------------------------
if ! grep -Fxq "source /opt/ros/humble/setup.bash" ~/.bashrc; then
    echo "Ajout de ROS2 Humble à votre ~/.bashrc..."
    echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
fi

# Sourcing immédiat pour la session en cours
echo "Activation de ROS2 Humble dans le terminal actuel..."
source /opt/ros/humble/setup.bash

# ----------------------------------------
# 2️⃣ Cloner le dépôt si nécessaire
# ----------------------------------------
if [ ! -d "ROS2-Humble-Simple-Project" ]; then
    echo "Clonage du dépôt ROS2-Humble-Simple-Project..."
    git clone https://github.com/kheiro-bellahcene/ROS2-Humble-Simple-Project.git
fi

cd ROS2-Humble-Simple-Project || { echo "Impossible d'entrer dans le dossier."; exit 1; }

# ----------------------------------------
# 3️⃣ Construire le package
# ----------------------------------------
PACKAGE_NAME="my_robot_controller"  # le nom de package 
echo "Construction du package $PACKAGE_NAME..."
colcon build --packages-select $PACKAGE_NAME

# ----------------------------------------
# 4️⃣ Sourcing du workspace
# ----------------------------------------
echo "Activation du workspace..."
source install/setup.bash

# Ajouter le sourcing du workspace à ~/.bashrc si nécessaire
if ! grep -Fxq "source $PWD/install/setup.bash" ~/.bashrc; then
    echo "Ajout du workspace à ~/.bashrc pour les prochaines sessions..."
    echo "source $PWD/install/setup.bash" >> ~/.bashrc
fi

# ----------------------------------------
# 5️⃣ Instructions pour l'utilisateur
# ----------------------------------------
echo "✅ Configuration terminée !"
echo "Vous pouvez maintenant lancer TurtleSim et le contrôleur :"
echo "Terminal 1 : ros2 run turtlesim turtlesim_node"
echo "Terminal 2 : ros2 run $PACKAGE_NAME turtle_controller"

# ----------------------------------------
# 6️⃣ Rendre le script exécutable pour la prochaine fois
# ----------------------------------------
SCRIPT_PATH="$(realpath "$0")"
if [ ! -x "$SCRIPT_PATH" ]; then
    echo "Rendre ce script exécutable pour les prochaines utilisations..."
    chmod +x "$SCRIPT_PATH"
    echo "✅ Script prêt : $SCRIPT_PATH"
fi

