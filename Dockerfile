FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm git cmake llvm clang make python graphviz

RUN echo "alias ll='ls -las'" >> ~/.bashrc

RUN git config --global --add safe.directory "/host/build"
RUN git config --global --add safe.directory "/host/build/_deps/fetchcontent_sqlite3-src"

WORKDIR /host

CMD ["/bin/bash"]
