THRESHOLD=75
CHECK_INTERVAL=10
MIGRATED=false

while true; do
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)
    echo "Current CPU Usage: $CPU_USAGE%"

    if [ "$CPU_USAGE" -gt "$THRESHOLD" ] && [ "$MIGRATED" = false ]; then
        echo "CPU usage exceeded $THRESHOLD%, migrating to GCP..."
        bash migrate.sh
        MIGRATED=true
    elif [ "$CPU_USAGE" -lt "$THRESHOLD" ] && [ "$MIGRATED" = true ]; then
        echo "CPU usage dropped below $THRESHOLD%, terminating GCP instance..."
        bash terminate.sh
        MIGRATED=false
    fi

    sleep $CHECK_INTERVAL
done
