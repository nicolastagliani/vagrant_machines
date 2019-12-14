#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Entering folder ${DIR}"
pushd ${DIR}
MACHINE_NAME=ubuntu-1804-lts-throwaway 
echo "Powering off machine ${MACHINE_NAME}"
VBoxManage controlvm ${MACHINE_NAME} poweroff
echo "Deleting machine ${MACHINE_NAME}"
VBoxManage unregistervm ${MACHINE_NAME} --delete
echo "Deleting local vagrant files"
rm -vrf ./.vagrant
popd
