#!/bin/sh

# Install sudo.
tdnf --assumeyes install sudo

# Install tar
tdnf --assumeyes install tar

# install tzdata
tdnf --assumeyes install tzdata