#!/bin/bash

# Number of cores to stress
CORES=2

# Percentage of CPU to stress (valid range: 0.1 to 99.9)
CPU_PERCENTAGE=50

# Duration of stress in seconds
DURATION=60

# Calculate the number of processes needed to achieve the desired CPU load
NUM_PROCESSES=$(echo "scale=2; $CORES * $CPU_PERCENTAGE / 100" | bc | awk '{print int($1 + 0.5)}')

echo "Stressing $CPU_PERCENTAGE% of CPU on $CORES cores for $DURATION seconds"

# Launch stress processes
for ((i=0; i<$NUM_PROCESSES; i++)); do
    while :; do
        sha256sum /dev/zero &
        PID=$!
        CORE_ID=$((i % CORES))
        taskset -cp $CORE_ID $PID > /dev/null
        sleep 0.1
        if [ $(ps -p $PID -o %cpu | tail -n 1 | sed 's/^ *//') -ge 100 ]; then
            break
        fi
    done
done

# Sleep for the specified duration
sleep $DURATION

# Clean up the stress processes
pkill sha256sum

echo "CPU stress test completed."
