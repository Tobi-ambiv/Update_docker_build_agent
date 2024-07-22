FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set environment variables
ENV AGENT_VERSION 2.206.1
ENV AGENT_HOME /agent

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    jq \
    curl \
    libunwind8 \
    libssl1.0 && \
    rm -rf /var/lib/apt/lists/*

# Create the agent directory
RUN mkdir -p ${AGENT_HOME}

# Download and extract the Azure Pipelines agent
RUN curl -LsS https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz | tar -xz -C ${AGENT_HOME}

# Change to the agent directory
WORKDIR ${AGENT_HOME}

# Install and configure the agent
RUN ./bin/installdependencies.sh

# Add configuration script
COPY configure-agent.sh .
RUN chmod +x configure-agent.sh

# Add entrypoint script
COPY start.sh .
RUN chmod +x start.sh

# Set the user to a non-root user (e.g., agentuser)
RUN useradd -m agentuser
RUN chown -R agentuser:agentuser ${AGENT_HOME}
USER agentuser

# Set entrypoint to start the agent
ENTRYPOINT ["./start.sh"]
