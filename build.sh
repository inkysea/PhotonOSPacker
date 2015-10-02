#!/usr/bin/env bash

packer build \
       -only=vagrant-vmware_desktop\
       -var 'iso_file=https://bintray.com/artifact/download/vmware/photon/iso/1.0TP2/x86_64/photon-minimal-1.0TP2.iso' \
       -var 'iso_sha1sum=a47567368458acd8c8ef5f1e3f793c5329063dac' \
       packer-photon.json

