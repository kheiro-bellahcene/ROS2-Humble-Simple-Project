#!/bin/bash
# setup_ros2.sh
# Script pour configurer rapidement le workspace ROS2 Humble pour le projet TurtleSim

# ----------------------------------------
# 0️⃣ Rendre le script exécutable dès le début (auto-réparation)
# ----------------------------------------
SCRIPT_PATH="$(realpath "$0")"
if [ ! -x "$SCRIPT_PATH" ]; then
    chmod +x "$SCRIPT_PATH"
    echo "⚙️ Script rendu exécutable pour les prochaines utilisations."
fi

echo "=========================================="
echo "🚀 Installation et configuration ROS2 Humble"
echo "=========================================="

# ----------------------------------------
# 1️⃣ Ajouter ROS2 Humble à ~/.bashrc si nécessaire
# ----------------------------------------
if ! grep -Fxq "source /opt/ros/humble/setup.bash" ~/.bashrc; then
    echo "➕ Ajout de ROS2 Humble à votre ~/.bashrc..."
    echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
else
    echo "✔️ ROS2 Humble déjà présent dans ~/.bashrc"
fi

# Sourcing immédiat pour la session actuelle
echo "🔄 Activation de ROS2 Humble pour ce terminal..."
source /opt/ros/humble/setup.bash

# ----------------------------------------
# 2️⃣ Cloner le dépôt si nécessaire
# ----------------------------------------
if [ ! -d "ROS2-Humble-Simple-Project" ]; then
    echo "📥 Clonage du dépôt ROS2-Humble-Simple-Project..."
    git clone https://github.com/kheiro-bellahcene/ROS2-Humble-Simple-Project.git
else
    echo "📂 Dépôt déjà présent, passage à l'étape suivante."
fi

cd ROS2-Humble-Simple-Project || { echo "❌ Impossible d'entrer dans le dossier."; exit 1; }

# ----------------------------------------
# 3️⃣ Construire le package
# ----------------------------------------
PACKAGE_NAME="my_robot_controller"  # Nom du package
echo "🔨 Construction du package $PACKAGE_NAME..."
colcon build --packages-select $PACKAGE_NAME

# ----------------------------------------
# 4️⃣ Sourcing du workspace
# ----------------------------------------
echo "🔄 Activation du workspace..."
source install/setup.bash

# Ajouter le workspace au ~/.bashrc pour les prochaines sessions
if ! grep -Fxq "source $PWD/install/setup.bash" ~/.bashrc; then
    echo "➕ Ajout du workspace à ~/.bashrc..."
    echo "source $PWD/install/setup.bash" >> ~/.bashrc
else
    echo "✔️ Workspace déjà ajouté au ~/.bashrc"
fi

# ----------------------------------------
# 5️⃣ Instructions finales
# ----------------------------------------
echo ""
echo "✅ Configuration terminée avec succès !"
echo ""
echo "📌 Pour lancer la démonstration :"
echo ""
echo "   🖥 Terminal 1 (lance la simulation TurtleSim) :"
echo "       ros2 run turtlesim turtlesim_node"
echo ""
echo "   🖥 Terminal 2 (lance le contrôleur Python) :"
echo "       ros2 run $PACKAGE_NAME turtle_controller"
echo ""
echo "ℹ️  Rappel : ouvrez deux terminaux séparés, ou utilisez un multiplexeur comme tmux/screen."
echo ""
echo "🎯 Bon test avec votre petite tortue ROS2 🐢 !"


