FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:0-12
ADD packages.sh /usr/local/bin
RUN chmod +x /usr/local/bin/packages.sh \
    && /bin/bash /usr/local/bin/packages.sh
