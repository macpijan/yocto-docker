#!/bin/bash

docker run --rm -it \
-v $(pwd):$(pwd) \
-v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK  \
-v ~/.gitconfig:/home/build/.gitconfig \
3mdeb/yocto-docker \
/bin/bash -c "ssh -T git@github.com; cd $(pwd) && source oe-init-build-env && bitbake $*"
