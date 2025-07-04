#!/bin/bash
# ⚠ FOR EDUCATIONAL & AUTHORIZED USE ONLY
# Author: RedVortex
# This script must not be run on systems you do not own or have permission to audit.

# Color variables
# ━━━━━━━━━ COLOR DEFINITIONS ━━━━━━━━━ #
LOGFILE="logs/reconlog_$(date +%F_%T).log"
mkdir -p logs
exec > >(tee -a "$LOGFILE") 2>&1

RESET="\e[0m"
BOLD="\e[1m"

# Normal Colors
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"
GRAY="\e[90m"

# Bold Colors
BOLD_BLACK="\e[1;30m"
BOLD_RED="\e[1;31m"
BOLD_GREEN="\e[1;32m"
BOLD_YELLOW="\e[1;33m"
BOLD_BLUE="\e[1;34m"
BOLD_MAGENTA="\e[1;35m"
BOLD_CYAN="\e[1;36m"
BOLD_WHITE="\e[1;97m"
BOLD_GRAY="\e[1;90m"
banner() {
  clear

  # Colors
  RED="\e[31m"
  GREEN="\e[32m"
  CYAN="\e[36m"
  MAGENTA="\e[35m"
  YELLOW="\e[33m"
  RESET="\e[0m"
  BOLD="\e[1m"

  # Line Art
echo -e "${MAGENTA}${BOLD}"
echo -e "\e[1;34m╔═════════════════════════════════════════════════════════════╗\e[0m"
echo -e "\e[1;34m║\e[0m               \e[1;31m🔥 RedVortex Recon Toolkit 🔥  \e[0m               \e[1;34m║\e[0m"
echo -e "\e[1;34m╠═════════════════════════════════════════════════════════════╣\e[0m"
echo -e "\e[1;34m║\e[0m \e[1;36mAuthor  :\e[0m \e[1;33mRedVortex\e[0m"
echo -e "\e[1;34m║\e[0m \e[1;36mVersion :\e[0m \e[1;33mv1.0\e[0m"
echo -e "\e[1;34m║\e[0m \e[1;36mPurpose :\e[0m \e[1;33mPost-Exploitation Recon | Target Profiling\e[0m"
echo -e "\e[1;34m╠═════════════════════════════════════════════════════════════╣\e[0m"
echo -e "\e[1;34m║\e[0m \e[1;36mSystem :\e[0m \e[1;33mkali  |  Kali GNU/Linux Rolling\e[0m"
echo -e "\e[1;34m║\e[0m \e[1;36mUser   :\e[0m \e[1;33mkali  |  Fri Jul  4 05:55:10 PM EDT 2025\e[0m"
echo -e "\e[1;34m╚═════════════════════════════════════════════════════════════╝\e[0m"
  echo -e "${RESET}"
}

iface=$(ip a | grep "state UP" | cut -d ":" -f2 | tr -d ' ') 
: << 'COMMENT_LINE'
╭─────────────────────────────╮
│  RedVortex Recon Tool       │
│  Author : RedVortex         │
│  Purpose: Post-exploit info │
│  Status : Dev Mode          │
╰─────────────────────────────╯
COMMENT_LINE

sysinfo () { 
    echo -e "${BOLD_MAGENTA}[+] SYSTEM INFORMATION [+]${RESET}"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}"
    echo -e "${BOLD_GREEN}✅ Hostname       → ${WHITE}$(hostname)"
    echo -e "${BOLD_GREEN}✅ OS Version     → ${WHITE}$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
    echo -e "${BOLD_GREEN}✅ Architecture   → ${WHITE}$(uname -m)"
    echo -e "${BOLD_GREEN}✅ Kernel Version → ${WHITE}$(uname -r)"
    echo -e "${BOLD_GREEN}✅ Uptime         → ${WHITE}$(uptime -p)"
    echo -e "${BOLD_GREEN}✅ Boot Time      → ${WHITE}$(who -b | awk '{print $3, $4}')"
    echo -e "${BOLD_GREEN}✅ Logged-in User → ${WHITE}$(whoami)"
    echo -e "${BOLD_GREEN}✅ All Users      → ${WHITE}$(cut -d: -f1 /etc/passwd | paste -sd ', ')"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}\n"
}
netinfo () {
    echo -e "${BOLD_MAGENTA}[+] NETWORK INFORMATION [+]${RESET}"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}"
    echo -e "${BOLD_GREEN}✅ Local IP         → ${WHITE}$(ip r | grep -oP '(?<=src )\d+\.\d+\.\d+\.\d+' | head -1)"
    echo -e "${BOLD_GREEN}✅ Public IP        → ${WHITE}$(curl -s ifconfig.me)"
    echo -e "${BOLD_GREEN}✅ MAC Address      → ${WHITE}$(cat /sys/class/net/$iface/address)"
    echo -e "${BOLD_GREEN}✅ Default Gateway  → ${WHITE}$(ip route | grep default | cut -d ' ' -f3)"
    echo -e "${BOLD_GREEN}✅ DNS Servers      → ${WHITE}$(grep '^nameserver' /etc/resolv.conf | awk '{print $2}' | paste -sd ', ')"
    echo -e "${BOLD_GREEN}✅ Open Ports       → ${WHITE}$(ss -tuln | grep -c LISTEN)"
    echo -e "${BOLD_GREEN}✅ Listening Svcs   → ${WHITE}$(netstat -tulpn | grep LISTEN | awk '{split($4,a,":"); split($7,b,"/"); print a[length(a)], b[2]}' | column -t)"
    echo -e "${BOLD_GREEN}✅ Active Connections → ${WHITE}$(netstat -antp | grep ESTABLISHED | wc -l)"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}\n"
}
disinof () {
    echo -e "${BOLD_MAGENTA}[+] DISK & STORAGE INFORMATION [+]${RESET}"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}"
    echo -e "${BOLD_GREEN}✅ Disk Partitions  → ${WHITE}"
    fdisk -l | grep '^Disk /' | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ Disk Usage       → ${WHITE}"
    df -h | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ Mount Points     → ${WHITE}"
    mount | column -t | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ Filesystem Info  → ${WHITE}"
    lsblk -f | sed 's/^/     /'
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}\n"
}
hardwinof () {
    echo -e "${BOLD_MAGENTA}[+] HARDWARE INFORMATION [+]${RESET}"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}"
    echo -e "${BOLD_GREEN}✅ CPU Info         → ${WHITE}"
    lscpu | grep -E 'Model name|Architecture|CPU\(s\)' | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ RAM Info         → ${WHITE}"
    free -h | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ GPU Info         → ${WHITE}$(lspci | grep -i vga | cut -d ':' -f3)"
    echo -e "${BOLD_GREEN}✅ Motherboard Info → ${WHITE}"
    dmidecode -t baseboard | grep -E 'Manufacturer|Product|Version' | sed 's/^/     /'
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}\n"
}

secinof () {
    echo -e "${BOLD_MAGENTA}[+] SECURITY & SERVICES [+]${RESET}"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}"
    echo -e "${BOLD_GREEN}✅ Running Services → ${WHITE}"
    systemctl list-units --type=service --state=running | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ Firewall Status  → ${WHITE}"
    iptables -L | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ Crontab Jobs     → ${WHITE}$(atq 2>/dev/null || echo 'None')"
    echo -e "${BOLD_GREEN}✅ Admin Users      → ${WHITE}$(grep -E '^sudo|admin' /etc/group | cut -d: -f1)"
    echo -e "${BOLD_GREEN}✅ Groups List      → ${WHITE}$(cut -d: -f1 /etc/group | paste -sd ', ')"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}\n"
}
extrainfo () {
    echo -e "${BOLD_MAGENTA}[+] EXTRA RECON [+]${RESET}"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}"
    echo -e "${BOLD_GREEN}✅ Top Processes    → ${WHITE}"
    ps aux --sort=-%mem | head -n 5 | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ Bash History     → ${WHITE}"
    tail -n 10 ~/.bash_history | sed 's/^/     /'
    echo -e "${BOLD_GREEN}✅ Hidden Files     → ${WHITE}$(ls -A ~ | grep "^\." | paste -sd ', ')"
    echo -e "${BOLD_RED}═══════════════════════════════════════════════════════════════════════════════${RESET}\n"
}
banner
while true ; do
	
echo -e "\e[1;35m╔═════════════════════════════════════════════════════╗\e[0m"
echo -e "\e[1;35m║\e[0m              \e[1;36m🔥 SYSTEM  RECON  REPORT 🔥\e[0m            \e[1;35m║\e[0m"
echo -e "\e[1;35m╠═════════════════════════════════════════════════════╣\e[0m"
echo -e "\e[1;35m║\e[0m   \e[36m[+]\e[0m \e[1;33m1\e[0m SYSTEM INFORMATION                          \e[1;35m║\e[0m"
echo -e "\e[1;35m║\e[0m   \e[36m[+]\e[0m \e[1;33m2\e[0m NETWORK INFORMATION                         \e[1;35m║\e[0m"
echo -e "\e[1;35m║\e[0m   \e[36m[+]\e[0m \e[1;33m3\e[0m DISK & STORAGE INFORMATION                  \e[1;35m║\e[0m"
echo -e "\e[1;35m║\e[0m   \e[36m[+]\e[0m \e[1;33m4\e[0m HARDWARE INFORMATION                        \e[1;35m║\e[0m"
echo -e "\e[1;35m║\e[0m   \e[36m[+]\e[0m \e[1;33m5\e[0m SECURITY & SERVICES                         \e[1;35m║\e[0m"
echo -e "\e[1;35m║\e[0m   \e[36m[+]\e[0m \e[1;33m6\e[0m EXTRA INFORMATION                           \e[1;35m║\e[0m"
echo -e "\e[1;35m║\e[0m   \e[36m[+]\e[0m \e[1;33m7\e[0m EXIT                                        \e[1;35m║\e[0m"
echo -e "\e[1;35m╚═════════════════════════════════════════════════════╝\e[0m  \n"
read -r -p $'\e[1;32mENTER YOUR OPTION : [example: 1,2,3] > \e[0m' choice

case $choice in
        1) sysinfo
        ;;
        2) netinfo
        ;;
        3) disinof
        ;;
        4) hardwinof
        ;;
        5) secinof
        ;;
        6) extrainfo
        ;;
        7) exit 0
        ;;
        *) echo "Invaild Choice plese Enter again"
esac
done

