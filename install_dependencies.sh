#!/bin/bash

echo -e "\e[1;36m[+] Installing required dependencies...\e[0m"

DEPS=(
  curl lscpu lsblk fdisk free dmidecode
  net-tools iproute2 iputils-ping
  netstat ss iptables at systemctl
)

for pkg in "${DEPS[@]}"; do
  echo -e "\e[1;34m[+] Checking $pkg...\e[0m"
  if ! command -v "$pkg" &>/dev/null; then
    echo -e "\e[1;33m[!] $pkg not found. Installing...\e[0m"
    sudo apt install -y "$pkg"
  else
    echo -e "\e[1;32m[✔] $pkg already installed.\e[0m"
  fi
done

echo -e "\e[1;32m[+] All dependencies checked and installed.\e[0m"