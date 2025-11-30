FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm git cmake llvm clang make python

# Whether to use the local files or the github repo. Usefull for development puroposes.
ARG USE_LOCAL_FILES=false

ARG DCP_GIT_URL=https://github.com/mzoesch/Decomposition.git
ARG DCP_GIT_DIR=/home/dcp

RUN if [ "$USE_LOCAL_FILES" = "false" ]; then \
    git clone $DCP_GIT_URL $DCP_GIT_DIR; \
    fi

COPY . /.dcp_tmp_local_copy

RUN if [ "$USE_LOCAL_FILES" = "true" ]; then \
    mkdir -p $DCP_GIT_DIR && cp -r /.dcp_tmp_local_copy/* $DCP_GIT_DIR; \
    fi

WORKDIR $DCP_GIT_DIR

ARG DCP_BUILD_DIR=$DCP_GIT_DIR/build
RUN python3 ./Launch.py -DoSetup -EnvBuildDir $DCP_BUILD_DIR

RUN echo "alias ll='ls -las'" >> ~/.bashrc

CMD ["/bin/bash"]
