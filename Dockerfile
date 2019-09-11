FROM archlinux/base

RUN pacman --noconfirm -Sy && \
    pacman --noconfirm -S glusterfs grep

CMD mkdir -p /var/gluster/bricks/brick0 && glusterd -N
