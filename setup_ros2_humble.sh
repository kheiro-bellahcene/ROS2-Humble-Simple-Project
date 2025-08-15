#!/bin/bash
# setup_ros2_humble.sh
# Script pour cloner et configurer rapidement le workspace ROS2 Humble pour le projet TurtleSim
# Peut être lancé depuis n'importe quel dossier

# Définir le dossier où cloner le projet (dans le dossier courant)
CURRENT_DIR="$(pwd)"
REPO_URL="https://github.com/kheiro-bellahcene/ROS2-Humble-Simple-Project.git"
PROJECT_DIR="$CURRENT_DIR/ROS2-Humble-Simple-Project"

# Cloner le dépôt si le dossier n'existe pas
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Clonage du dépôt $REPO_URL dans $PROJECT_DIR..."
    git clone $REPO_URL "$PROJECT_DIR"
else
    echo "Le dépôt $PROJECT_DIR existe déjà. Passage à la configuration..."
fi

# Aller dans le dossier du projet
cd "$PROJECT_DIR" || { echo "Impossible de se placer dans $PROJECT_DIR"; exit 1; }

# Ajouter ROS2 Humble à ~/.bashrc si nécessaire
if ! grep -Fxq "source /opt/ros/humble/setup.bash" ~/.bashrc; then
    echo "Ajout de ROS2 Humble à votre ~/.bashrc..."
    echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
fi

# Activer ROS2 Humble dans cette session
echo "Activation de ROS2 Humble..."
source /opt/ros/humble/setup.bash

# Construire le package
PACKAGE_NAME="my_robot_controller"  # Nom de ton package
echo "Construction du package $PACKAGE_NAME..."
colcon build --packages-select $PACKAGE_NAME

# Sourcing du workspace
WORKSPACE_PATH="$(pwd)"
echo "Activation du workspace depuis : $WORKSPACE_PATH"
source "$WORKSPACE_PATH/install/setup.bash"

# Ajouter à ~/.bashrc si pas déjà fait
if ! grep -Fxq "source $WORKSPACE_PATH/install/setup.bash" ~/.bashrc; then
    echo "Ajout du workspace à ~/.bashrc..."
    echo "source $WORKSPACE_PATH/install/setup.bash" >> ~/.bashrc
fi

# Instructions utilisateur
echo ""
echo "✅ Configuration terminée !"
echo ""
echo "Pour lancer le projet :"
echo " Terminal 1 : ros2 run turtlesim turtlesim_node"
echo " Terminal 2 : ros2 run $PACKAGE_NAME turtle_controller"
