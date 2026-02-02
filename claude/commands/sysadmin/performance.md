---
description: Analyze and improve system performance
thinking: true
---

# System Performance Analysis

Help me analyze and optimize system performance.

## Performance Analysis Steps

### 1. Current State Assessment

**CPU**:
```bash
top -bn1 | head -20
mpstat 1 5
```
- Usage patterns
- Process CPU consumption
- Load average

**Memory**:
```bash
free -h
vmstat 1 5
```
- RAM usage
- Swap usage
- Memory pressure

**Disk**:
```bash
df -h
iostat -x 1 5
```
- Disk space
- I/O performance
- Disk utilization

**Network**:
```bash
ifstat 1 5
netstat -s
```
- Network throughput
- Packet statistics
- Errors/drops

**Processes**:
```bash
ps aux --sort=-%mem | head -10
ps aux --sort=-%cpu | head -10
```
- Resource hogs
- Zombie processes
- Process states

### 2. Identify Bottlenecks

Common bottlenecks:
- CPU saturation
- Memory exhaustion
- Disk I/O wait
- Network congestion
- Process limits

### 3. Optimization Strategies

**For CPU Issues**:
- Identify CPU-intensive processes
- Check for runaway processes
- Consider nice/renice
- Review cron jobs
- Optimize application code

**For Memory Issues**:
- Check for memory leaks
- Review swap usage
- Adjust swappiness
- Kill memory hogs
- Add more RAM (if needed)

**For Disk Issues**:
- Check disk usage
- Clean up old files
- Optimize I/O scheduler
- Consider SSD upgrade
- Check for failing disk

**For Network Issues**:
- Check bandwidth usage
- Review firewall rules
- Optimize network settings
- Check for DDoS/attacks

### 4. System Tuning

**Kernel Parameters** (/etc/sysctl.conf):
- vm.swappiness
- fs.file-max
- net.core parameters

**Service Optimization**:
- Disable unused services
- Optimize service configs
- Review startup items

**Resource Limits** (/etc/security/limits.conf):
- Open files limits
- Process limits
- Memory limits

### 5. Monitoring Setup

Set up ongoing monitoring:
- htop for real-time view
- Logging for historical data
- Alerts for issues
- Performance baselines

### 6. Before/After Comparison

Measure improvements:
- Benchmark before changes
- Apply optimizations
- Benchmark after changes
- Document results

Guide me through systematic performance analysis and provide specific optimization recommendations for this system.
