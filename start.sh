#!/bin/bash

# Check if required environment variables are set
if [ -z "$AGENT_TOKEN" ]; then
    echo "error: missing AGENT_TOKEN environment variable" >&2
    exit 1
fi

if [ -z "$AZP_URL" ]; then
    echo "error: missing AZP_URL environment variable" >&2
    exit 1
fi

if [ -z "$AZP_POOL" ]; then
    echo "error: missing AZP_POOL environment variable" >&2
    exit 1
fi

# Configure the agent
./config.sh --unattended --url "$AZP_URL" --auth pat --token "$AGENT_TOKEN" --pool "$AZP_POOL" --agent "$(hostname)" --replace

# Run the agent
exec ./run.sh
