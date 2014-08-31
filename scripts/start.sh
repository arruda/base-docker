#!/bin/bash
# Stop on error
set -e

# where is the data dir (has to be a volume to persist the info if is the first run or not)
DATA_DIR=/data

# any linked container that has to be working before anything happen
LINK_CONTAINER=${SOME_PORT}
LINKED_CONTAINER_ADDR=$SOME_PORT_XXXX_TCP_ADDR
LINKED_CONTAINER_PORT=$SOME_PORT_XXXX_TCP_PORT

echo "waitig for other linked container"
while ! exec 6<>/dev/tcp/${LINKED_CONTAINER_ADDR}/${LINKED_CONTAINER_PORT}; do
    echo "$(date) - still trying to connect to container at ${SOME_PORT}"
    sleep 1
done


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
