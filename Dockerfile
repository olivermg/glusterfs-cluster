FROM archlinux/base

RUN pacman --noconfirm -Sy && \
    pacman --noconfirm -S glusterfs grep

CMD glusterd -N
