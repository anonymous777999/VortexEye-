# 🔥 RedVortex Recon Toolkit

The **RedVortex Recon Toolkit** is a powerful post-exploitation and information gathering tool for Linux systems. Designed for hackers, by a hacker.

> ⚠️ Warning: This tool is **powerful**. Misuse may lead to unintended consequences. Use ethically and responsibly.

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

**RedVortex** – A student of CyberSecurity and Ethical Hacking, forging his own elite path.  
🔥 Follow the mission on GitHub or contact for the Pro version.

---

## ⚠️ Legal Disclaimer

This tool is intended **for educational and authorized use only**.  
The author is **not responsible** for any misuse or damage caused by this tool.