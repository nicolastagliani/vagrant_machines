#!/bin/bash
MACHINE_NAME=ubuntu-1804-lts-throwaway 
echo "Powering off machine ${MACHINE_NAME}"
VBoxManage controlvm ${MACHINE_NAME} poweroff
echo "Deleting machine ${MACHINE_NAME}"
VBoxManage unregistervm ${MACHINE_NAME} --delete
echo "Deleting local vagrant files"
rm -rf .vagrant
