FROM ubuntu:22.04

RUN apt update && apt install -y \
    build-essential \
    check \
    lcov \
    gcovr \
    git \
    make \
    pkg-config \
    vim \
    curl

RUN useradd -ms /bin/bash devuser
USER devuser
WORKDIR /home/devuser/app
CMD ["/bin/bash"]
