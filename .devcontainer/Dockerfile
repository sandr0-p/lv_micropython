# Use Ubuntu as base OS
FROM ubuntu:24.04

# Install tools
RUN apt-get update
RUN apt-get install -y procps curl
RUN apt-get install wget -y

# Install GCC
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y gdb
RUN apt-get install -y gcc-arm-none-eabi                       
RUN gcc --version

# Install CMAKE
RUN apt-get update
RUN apt-get install -y cmake
RUN cmake --version

# Install doxygen
RUN apt-get update
RUN apt-get install -y doxygen
RUN doxygen --version                                             

# Install pip
RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip --version

# Get and Install Node
# https://github.com/nodejs/node
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs

# Install Git
RUN apt-get install -y git
RUN apt-get install git-lfs

# Install GitHub CLI
# https://github.com/cli/cli
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list >/dev/null
RUN apt-get update
RUN apt-get install gh

# Install Shell
RUN mkdir install
COPY /shell /install/shell
RUN chmod +x /install/shell/install.sh
RUN /bin/bash -c "./install/shell/install.sh"

RUN pip install pycparser --break-system-packages 