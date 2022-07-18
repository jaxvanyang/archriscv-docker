FROM scratch

ARG RELEASE

# Add RootFS to the root
ADD archriscv-${RELEASE}.tar.zst .
