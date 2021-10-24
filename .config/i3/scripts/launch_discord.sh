#!/bin/bash

# Check if discord is running and run if not
if ! pgrep "Discord" > /dev/null
then    
        /usr/bin/discord
fi