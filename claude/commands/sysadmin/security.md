---
description: Security audit and hardening for Linux systems
thinking: true
---

# System Security Audit

Help me audit and improve the security of this Linux system.

## Security Checklist

### 1. User & Access Control
- [ ] Review user accounts (who should have access?)
- [ ] Check for unused accounts
- [ ] Verify sudo permissions
- [ ] Review SSH keys
- [ ] Check password policies
- [ ] Disable root login via SSH

### 2. SSH Hardening
- [ ] Disable password authentication (use keys)
- [ ] Change default SSH port (optional)
- [ ] Configure fail2ban
- [ ] Limit SSH access by user/IP
- [ ] Use SSH key passphrases
- [ ] Review ~/.ssh/authorized_keys

### 3. Firewall
- [ ] Enable UFW (Uncomplicated Firewall)
- [ ] Configure allowed ports
- [ ] Block unnecessary services
- [ ] Review current rules
- [ ] Set default deny policy

### 4. Updates & Patches
- [ ] Check for system updates
- [ ] Enable automatic security updates
- [ ] Review update history
- [ ] Check for EOL software

### 5. Services & Ports
- [ ] List running services
- [ ] Disable unnecessary services
- [ ] Review open ports
- [ ] Check listening services
- [ ] Verify service permissions

### 6. File Permissions
- [ ] Check sensitive file permissions (/etc/passwd, /etc/shadow)
- [ ] Review home directory permissions
- [ ] Check SUID/SGID files
- [ ] Verify critical system files

### 7. Logs & Monitoring
- [ ] Review system logs
- [ ] Check authentication logs
- [ ] Monitor failed login attempts
- [ ] Set up log rotation
- [ ] Consider log monitoring tools

### 8. Application Security
- [ ] Review installed packages
- [ ] Remove unnecessary software
- [ ] Check for vulnerable packages
- [ ] Update applications
- [ ] Verify sources (PPAs, repos)

### 9. Network Security
- [ ] Review network interfaces
- [ ] Check routing table
- [ ] Verify DNS settings
- [ ] Review /etc/hosts
- [ ] Check for suspicious connections

### 10. Backup & Recovery
- [ ] Verify backups exist
- [ ] Test backup restoration
- [ ] Document recovery process
- [ ] Secure backup storage

## Commands to Run

Guide me through running security checks and implementing hardening measures. Explain each step and the security benefit.

**Safety First**: Explain risks before making changes that could lock me out.
