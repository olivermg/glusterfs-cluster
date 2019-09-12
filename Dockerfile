FROM archlinux/base

RUN pacman --noconfirm -Sy && \
    pacman --noconfirm -S glusterfs grep

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
