#!/bin/bash

# The name of the seafile folder synchronized
SEAF_FOLDER="Notes"

SYNC_STATUS=$(seaf-cli status | grep "$SEAF_FOLDER" | awk '{print $2}')
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$SYNC_STATUS
else
    STATUS="No seaf-cli daemon is running"
fi

if [ "$STATUS" = "synchronized" ]; then
    echo "%{F#02c084}痢"
else
    echo "%{F#ed404c}裏"
fi