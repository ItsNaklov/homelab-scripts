#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Services to check — name and port separated by comma
# Add or remove services here without touching anything else
SERVICES=(
  "Linkding,30900"
  "Grafana,30300"
  "Prometheus,30090"
)

# Print header
echo "================================"
echo "  Homelab Health Check"
echo "================================"

# Loop through every service in the list
for SERVICE in "${SERVICES[@]}"; do

  # Split the name and port apart on the comma
  NAME=$(echo "$SERVICE" | cut -d',' -f1)
  PORT=$(echo "$SERVICE" | cut -d',' -f2)

  # Make an HTTP request, grab only the status code
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:$PORT)

  # If we got 200 back, service is up. Anything else, it's down.
  if [ "$STATUS" = "302" ]; then
    echo -e "${GREEN}[OK]${NC}     $NAME :$PORT"
  else
    echo -e "${RED}[FAILED]${NC} $NAME :$PORT"
  fi

done

echo "================================"
