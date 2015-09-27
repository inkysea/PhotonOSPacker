#!/bin/sh

HOME_DIR="/home/photon"

# Set up a photon user and add the insecure key for User to login
useradd -G users -m photon

# Configure a sudoers for the photon user
echo "photon ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/photon

# Set up insecure Vagrant key
mkdir -p ${HOME_DIR}/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDthSDXw2ebI9oSL3gOGNyGDFnnHOtXVw4uI9zKcKNGvphTKr7bblFs5uvUzAvFLVV6eTy32crSegYfDVos5MV1fbknp8K7fz/BCaE1hlzGRgTFV0Vz4YesrgZOJT1JizCJcrgtueV8XtWfpSugXK7MHUsBidNMrHs9+87o5ZmJ4TOUau4LIzx+NxYY0nu1AxlKfycuhjbyDxEhTw9iLIl4R99w8JY20SM5RrmNZ7sVS9dF52E4EeNYf2Q+Rkoiblzzk4eQp0bYQ6xH249vr71V3gAlSIKEm+Fa1itfqkswXIHsCYPnp0LW/3xI+6rTgtwPBJe8FwzFZn+sO1cW5Nb3 inkysea" > ${HOME_DIR}/.ssh/authorized_keys
chown -R photon:users ${HOME_DIR}/.ssh
chmod 700 ${HOME_DIR}/.ssh
chmod 600 ${HOME_DIR}/.ssh/authorized_keys

# Add Docker group
groupadd docker

# Add Photon user to Docker group
usermod -a -G docker photon
