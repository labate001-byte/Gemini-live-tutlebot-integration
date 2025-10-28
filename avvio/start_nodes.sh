#!/bin/bash
# ===========================================
# Script per avviare i nodi TurtleBot3 in terminali separati
# ===========================================

# Percorso assoluto di lavoro
WORKDIR="$WORKSPACE_PATH"


# Funzione per preparare ambiente in ogni terminale
PREP_CMD="source /opt/ros/humble/setup.bash && cd $WORKDIR && colcon build --symlink-install && source install/setup.bash"

# 1️⃣ Nodo distanza
gnome-terminal -- bash -c "$PREP_CMD && echo '✅ Nodo distanza avviato' && ros2 run turtlebot_controller turtle_distance_publisher; exec bash"

# 2️⃣ Nodo CSV
gnome-terminal -- bash -c "$PREP_CMD && echo '✅ Nodo CSV avviato' && ros2 run turtlebot_controller turtle_csv_handler; exec bash"

# 3️⃣ Nodo movimento
gnome-terminal -- bash -c "$PREP_CMD && echo '✅ Nodo movimento avviato' && ros2 run turtlebot_controller move_turtle_AB; exec bash"

# 4️⃣ (opzionale) Terminale libero per debug o comandi ROS
gnome-terminal -- bash -c "$PREP_CMD && echo '🧩 Terminale libero per comandi ROS'; exec bash"

echo "==========================================="
echo "🔥 Tutti i nodi sono stati avviati in nuove finestre."
echo "==========================================="
