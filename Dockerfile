ARG RELEASE

FROM scratch

# Add RootFS to the root
ADD archriscv-${RELEASE}.tar.zst .
