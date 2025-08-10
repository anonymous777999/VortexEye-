                                                       **VortexEye — Post-Exploitation Recon Toolkit**
**Overview**
VortexEye is a bash-based reconnaissance toolkit crafted for post-exploitation scenarios. Built by RedVortex, it streamlines internal enumeration—enabling asset discovery, user and service enumeration, network mapping, and threat assessment—all from a compromised host.


**Features:**
Fast and lightweight reconnaissance suite for post-exploitation.
Discovers network details, running processes, and user accounts.
Enumerates open ports, services, and system information.
Designed to support red team and SOC operations with quick data output.

**Disclaimer**
Only use VortexEye in environments you own or with explicit permission.
Unauthorized use is illegal and unethical. This tool is intended for training, pentesting, and responsible security research only.

> **⚠️ Warning:** This tool is **powerful**. Misuse may lead to unintended consequences. Use ethically and responsibly.

---

## 🧠 Features

- ✅ System Information (OS, hostname, uptime, users)
- ✅ Network Recon (IP, MAC, DNS, open ports, connections)
- ✅ Disk & Storage Details (usage, partitions, filesystems)
- ✅ Hardware Info (CPU, RAM, GPU, Motherboard)
- ✅ Security & Services (firewall, crontab, sudo/admin users)
- ✅ Extra Recon (processes, hidden files, bash history)
- 🎨 Beautiful colored terminal UI
- 📝 Automatic logging with timestamps

---

## 📦 Dependencies

Make sure the following commands are available:

- `bash`
- `curl`
- `lscpu`, `lsblk`, `fdisk`, `free`, `dmidecode`
- `netstat`, `ss`, `iptables`, `atq`
- `systemctl`, `hostname`, `uptime`, `df`, `mount`
- `ps`, `whoami`, `cut`, `grep`, `awk`, `sed`, `tee`

---

## 🛠 Installation

1. Clone the repo:

```bash
git clone https://github.com/RedVortex/recon-toolkit.git
cd recon-toolkit
```

2. Make script executable:

```bash
chmod +x recon.sh
```

3. (Optional) Install dependencies:

```bash
bash install_dependencies.sh
```

4. Run the toolkit:

```bash
./recon.sh
```

---

## 📂 Logs

All output will be logged automatically under the `/logs` directory. Files are timestamped.

---

## 🧙 Author
RedVortex — Cybersecurity student, SOC enthusiast, and offensive security builder.
Connect on LinkedIn: (https://www.linkedin.com/in/shubham-gautam-225187218/)
Check out more projects: https://github.com/anonymous777999

---

## ⚠️ Legal Disclaimer

This tool is intended **for educational and authorized use only**.  
The author is **not responsible** for any misuse or damage caused by this tool.
