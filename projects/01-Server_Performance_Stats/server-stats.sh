#!/bin/bash

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Cabeçalho
echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}      ESTATÍSTICAS DO SERVIDOR${NC}"
echo -e "${BLUE}=========================================${NC}"
echo "Data/Hora: $(date)"
echo

# 1. Informações do Sistema
echo -e "${YELLOW}1. INFORMAÇÕES DO SISTEMA:${NC}"
echo "Distribuição: $(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/*release 2>/dev/null | head -n1)"
echo "Kernel: $(uname -r)"
echo "Arquitetura: $(uname -m)"
echo

# 2. Uso da CPU
echo -e "${YELLOW}2. USO DA CPU:${NC}"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
echo "Uso Total: $cpu_usage"
echo

# 3. Uso de Memória
echo -e "${YELLOW}3. USO DE MEMÓRIA:${NC}"
free -h | awk '
/Mem:/ {
    printf "Total: %s | Usada: %s | Livre: %s | Porcentagem: %.2f%%\n", 
    $2, $3, $4, ($3/$2)*100
}'
echo

# 4. Uso de Disco
echo -e "${YELLOW}4. USO DE DISCO:${NC}"
df -h / | awk '
NR==2 {
    printf "Total: %s | Usado: %s | Livre: %s | Porcentagem: %s\n",
    $2, $3, $4, $5
}'
echo

# 5. Tempo de Atividade e Carga Média
echo -e "${YELLOW}5. TEMPO DE ATIVIDADE E CARGA:${NC}"
uptime | awk -F'load average:' '{
    gsub(/^[ \t]+|[ \t]+$/, "", $1);
    gsub(/^[ \t]+|[ \t]+$/, "", $2);
    print "Tempo de Atividade: " $1
    print "Carga Média: " $2
}'
echo

# 6. Usuários Conectados
echo -e "${YELLOW}6. USUÁRIOS CONECTADOS:${NC}"
who | wc -l | awk '{print "Total de usuários conectados: " $1}'
echo

# 7. Processos Top 5 por CPU
echo -e "${YELLOW}7. TOP 5 PROCESSOS (CPU):${NC}"
ps aux --sort=-%cpu | head -n 6 | awk '
NR==1 {printf "%-8s %-8s %-8s %-12s %s\n", "USER", "PID", "%CPU", "MEM", "COMMAND"}
NR>1 {printf "%-8s %-8s %-8.2f %-12s %s\n", $1, $2, $3, $4, $11}'
echo

# 8. Processos Top 5 por Memória
echo -e "${YELLOW}8. TOP 5 PROCESSOS (MEMÓRIA):${NC}"
ps aux --sort=-%mem | head -n 6 | awk '
NR==1 {printf "%-8s %-8s %-8s %-12s %s\n", "USER", "PID", "%CPU", "MEM", "COMMAND"}
NR>1 {printf "%-8s %-8s %-8.2f %-12s %s\n", $1, $2, $3, $4, $11}'
echo

# 9. Tentativas de Login Falhas
echo -e "${YELLOW}9. TENTATIVAS DE LOGIN FALHAS:${NC}"
if [ -f /var/log/auth.log ]; then
    failed_logins=$(grep "Failed password" /var/log/auth.log | wc -l)
    echo "Total de tentativas falhas: $failed_logins"
elif [ -f /var/log/secure ]; then
    failed_logins=$(grep "Failed password" /var/log/secure | wc -l)
    echo "Total de tentativas falhas: $failed_logins"
else
    echo "Arquivo de log não encontrado (verifique /var/log/auth.log ou /var/log/secure)"
fi