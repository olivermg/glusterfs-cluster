build: build-glusterfs4 build-glusterfs7

build-glusterfs4:
	docker build -f Dockerfile.glusterfs4 . -t my-glusterfs4

build-glusterfs7:
	docker build -f Dockerfile.glusterfs7 . -t my-glusterfs7


clean: clean-glusterfs4 clean-glusterfs7

clean-glusterfs4:
	docker rmi my-glusterfs4

clean-glusterfs7:
	docker rmi my-glusterfs7


.PHONY: build build-glusterfs4 build-glusterfs7 clean-glusterfs4 clean-glusterfs7 clean
