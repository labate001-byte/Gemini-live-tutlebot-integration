#!/bin/bash
# ===========================================
# Script per avviare i nodi TurtleBot3 in terminali separati
# ===========================================

# Percorso assoluto di lavoro
WORKDIR="$WORKSPACE_PATH"

# --- MODIFICA CHIAVE ---
# La riga seguente NON esegue più "colcon build". 
# Carica solo l'ambiente che "Avvio.sh" ha già costruito.
PREP_CMD="source /opt/ros/humble/setup.bash && cd $WORKDIR && source install/setup.bash"

# 1️⃣ Nodo distanza
gnome-terminal -- bash -c "$PREP_CMD && echo '✅ Nodo distanza avviato' && ros2 run turtlebot_controller turtle_distance_publisher; exec bash"

# 2️⃣ Nodo CSV
gnome-terminal -- bash -c "$PREP_CMD && echo '✅ Nodo CSV avviato' && ros2 run turtlebot_controller turtle_csv_handler; exec bash"

# 3️⃣ Nodo movimento (ora in attesa del comando vocale)
gnome-terminal -- bash -c "$PREP_CMD && echo '✅ Nodo movimento avviato (in attesa di comando vocale)' && ros2 run turtlebot_controller move_turtle_AB; exec bash"

# 4️⃣ 🎙️ Nodo VOCALE (filtrato e corretto)
# Questo comando nasconde il "rumore" ALSA/jack ma mostra i log [INFO]
gnome-terminal -- bash -c "$PREP_CMD && echo '🎙️ Nodo vocale avviato (dì "vieni qui")' && ros2 run turtlebot_controller voice_interface --ros-args --log-enable-stdio-logging 2>/dev/null; exec bash"

# 5️⃣ (opzionale) Terminale libero per debug o comandi ROS
gnome-terminal -- bash -c "$PREP_CMD && echo '🧩 Terminale libero per comandi ROS'; exec bash"

echo "==========================================="
echo "🔥 Tutti i nodi sono stati avviati in nuove finestre."
echo "==========================================="
