# #!/bin/bash

# ACTION=$1

# case $ACTION in
#   install)
#     echo "Installing Azure Pipelines agent service..."
#     # Add installation steps if needed, avoid systemd
#     ;;
#   start)
#     echo "Starting Azure Pipelines agent service..."
#     # Start the agent without sudo or systemd
#     exec ./run.sh
#     ;;
#   stop)
#     echo "Stopping Azure Pipelines agent service..."
#     # Add steps to stop the agent service if needed
#     ;;
#   *)
#     echo "Usage: $0 {install|start|stop}"
#     exit 1
#     ;;
# esac
