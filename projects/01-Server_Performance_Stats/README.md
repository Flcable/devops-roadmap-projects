# Server Stats Script 🖥️
https://roadmap.sh/projects/server-stats

A lightweight Bash script for monitoring basic Linux server statistics.

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## 📊 Features

- **CPU Usage** - Total CPU utilization percentage
- **Memory Usage** - Free vs used memory with percentage
- **Disk Usage** - Free vs used disk space with percentage
- **Top Processes** - Top 5 processes by CPU and memory
- **System Info** - OS version, uptime, load average
- **Security** - Connected users and failed login attempts

## 🚀 Quick Start

### Prerequisites
- Linux system
- Bash shell
- Basic commands: `top`, `free`, `df`, `ps`, `who`

### Installation

```bash
# Download the script
curl -o server-stats.sh https://raw.githubusercontent.com/yourusername/server-stats/main/server-stats.sh

# Make executable
chmod +x server-stats.sh

# Run it
./server-stats.sh
```

### One-liner Installation
```bash
curl -s https://raw.githubusercontent.com/yourusername/server-stats/main/server-stats.sh | bash
```

## 📋 Sample Output

```
=========================================
      ESTATÍSTICAS DO SERVIDOR
=========================================
Data/Hora: Fri Dec 13 10:30:00 UTC 2024

1. INFORMAÇÕES DO SISTEMA:
Distribuição: Ubuntu 22.04.3 LTS
Kernel: 5.15.0-91-generic

2. USO DA CPU:
Uso Total: 15.2%

3. USO DE MEMÓRIA:
Total: 7.6G | Usada: 4.2G | Livre: 2.1G | Porcentagem: 55.26%
```

## 🔧 Advanced Usage

### Scheduled Monitoring with Cron
```bash
# Add to crontab for hourly execution
0 * * * * /path/to/server-stats.sh >> /var/log/server-stats.log
```

### Output to File
```bash
./server-stats.sh > server-status-$(date +%Y%m%d).log
```

### Run with Watch (Real-time monitoring)
```bash
watch -n 5 ./server-stats.sh
```

## 🐛 Troubleshooting

**Permission denied error:**
```bash
chmod +x server-stats.sh
```

**Command not found:**
- Ensure basic system utilities are installed
- Test with: `which top free df ps who`

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built for Linux system administrators
- Lightweight and dependency-free
- Compatible with most Linux distributions

---

**Note**: Always test scripts in a development environment before using in production.

⭐ Star this repo if you find it useful!