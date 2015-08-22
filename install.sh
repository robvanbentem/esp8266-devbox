#!/usr/bin/env bash
set -ex

echo "----- INSTALLING PACKAGES -----"

sudo apt-get update
sudo apt-get install -y git autoconf build-essential linux-image-extra-virtual gperf bison flex texinfo libtool libncurses5-dev wget gawk python-serial libexpat-dev unzip nmon

echo "----- CLONING REPO -----"

sudo mkdir /opt/esp-open-sdk
sudo chown vagrant:vagrant /opt/esp-open-sdk
git clone --recursive https://github.com/pfalcon/esp-open-sdk.git /opt/esp-open-sdk

cd /opt/esp-open-sdk

echo "----- BUILDING STANDALONE SDK -----"

make STANDALONE=y

echo "----- UPDATING PATH -----"

echo 'PATH=$PATH:/opt/esp-open-sdk/xtensa-lx106-elf/bin' >> ~/.bashrc
echo 'PATH=$PATH:/opt/esp-open-sdk/esptool' >> ~/.bashrc

PATH=$PATH:/opt/esp-open-sdk/xtensa-lx106-elf/bin
PATH=$PATH:/opt/esp-open-sdk/esptool

echo "----- DONE -----"
