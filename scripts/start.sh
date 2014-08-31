#!/bin/bash
# Stop on error
set -e

if [[ -e $DATA_DIR/firstrun ]]; then
  source /scripts/normal_run.sh
else
  source /scripts/first_run.sh
fi

pre_start_action

post_start_action

# Start Process
echo "Starting My Proccess..."
my_proccess.sh
