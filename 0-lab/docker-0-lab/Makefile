MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILE_DIR  := $(dir $(MAKEFILE_PATH))

BUILD_ARTIFACTS_PATH=artifacts

container:
	docker buildx build --rm -t  ghcr.io/danet-hda/computer-networking/winter2324-rn-lab0 --load -f ./lab0.Dockefile .


