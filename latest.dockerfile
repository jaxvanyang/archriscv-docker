ARG REPO
ARG RELEASE

FROM ${REPO}/archriscv:${RELEASE}

RUN pacman -Syu --noconfirm
