#!/bin/bash 

# Upgrade and autoremove the packages with no interaction
apt-get update -y
export DEBIAN_FRONTEND=noninteractive
apt-get  -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade -q -y

echo "Installing the rest of the packages"
apt-get install -y net-tools git git-lfs build-essential clang clang-format ccache python3-pip ninja-build valgrind cmake
echo "Installing opengl-dev packages"
apt-get install -y libgl-dev pkg-config xorg-dev libx11-xcb-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-xkb-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-xinerama0-dev xkb-data  libglu1-mesa-dev

# Nice to have packages
# Autocompletion in terminal for git
apt-get install -y bash-completion clang-6.0 clang-tidy-6.0

apt-get autoremove -y
apt-get autoclean -y
