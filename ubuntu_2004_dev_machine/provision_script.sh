# Upgrade and autoremove the packages with no interaction
apt-get update -y
export DEBIAN_FRONTEND=noninteractive
apt-get  -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade -q -y

echo "Installing the rest of the packages"
apt-get install -y  git git-lfs build-essential clang clang-format ccache python3-pip ninja-build valgrind cmake

# Nice to have packages
# Autocompletion in terminal for git
apt-get install -y bash-completion clang-6.0 clang-tidy-6.0

apt-get autoremove -y
apt-get autoclean -y
