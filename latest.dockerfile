ARG USER
ARG RELEASE

FROM ${USER}/archriscv:${RELEASE}

RUN pacman -Syu --noconfirm && pacman -Scc
