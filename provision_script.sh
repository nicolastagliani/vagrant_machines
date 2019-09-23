echo "Hello, I'm the provision script"
echo "I'm running in $(uname) from $(whoami)"
echo "Installing docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker vagrant
rm get-docker.sh

echo "Installing the rest of the packages"
apt-get install -y build-essentials  git git-lfs build-essential clang clang-format ccache python-pip ninja-build valgrind
# Nice to have packages
# Autocompletion in terminal for git
apt-get install -y bash-completion clang-6.0 clang-tidy-6.0

pip install conan

echo "Final cleanup and update of the system"
# final update of the system and clean of unused/downloaded packages
# Upgrade and autoremove the packages with no interaction
apt-get update -y
export DEBIAN_FRONTEND=noninteractive
apt-get -o "Dpkg::Options::=--force-confold" upgrade -y
apt-get autoremove -y
apt-get autoclean -y
