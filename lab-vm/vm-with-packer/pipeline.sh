#!/bin/bash
set -e # abort if there is an issue with any build
packer init .
packer build -only='virtualbox-iso.baseimage' .
packer build -only='virtualbox-ovf.rechnernetze' .
rm -r output-baseimage
