# Remote Access Setup - ormus-pop-os

**Purpose**: Control this machine from MidnightSun (Windows) and Android phone while traveling.

---

## Quick Reference

| Method | From | To | Use Case |
|--------|------|-----|----------|
| SSH via Tailscale | MidnightSun/Phone | ormus-pop-os | Terminal commands |
| RustDesk | MidnightSun/Phone | ormus-pop-os | Full desktop control |

---

## Connection Details

### This Machine (ormus-pop-os)
- **Tailscale IP**: `100.88.76.14`
- **Hostname**: `ormus-pop-os`
- **RustDesk ID**: `431883450`

### MidnightSun (Already Connected)
- **Tailscale IP**: `100.103.62.20`
- **Status**: Connected to same Tailnet

---

## 1. Terminal Access (SSH)

### From MidnightSun (Windows)
Open PowerShell or Windows Terminal:
```powershell
ssh hermeticormus@100.88.76.14
# or using hostname (if MagicDNS enabled):
ssh hermeticormus@ormus-pop-os
```

### From Android
1. Install **Termux** from F-Droid (NOT Play Store version)
2. In Termux: `pkg install openssh`
3. Connect: `ssh hermeticormus@100.88.76.14`

Or use **JuiceSSH** app for a nicer mobile experience.

---

## 2. GUI Access (RustDesk)

### On ormus-pop-os (This Machine)
- **Status**: Installed and configured to autostart
- **ID**: `431883450`
- **Password**: Set via GUI (see First-Time Setup below)

### Password
Stored in GNOME Keyring. Retrieve with:
```bash
secret-tool lookup service rustdesk machine ormus-pop-os
```

### From MidnightSun (Windows)
1. Download RustDesk: https://rustdesk.com/
2. Install and open
3. Enter ID: `431883450`
4. Enter your permanent password
5. Connect

### From Android
1. Install RustDesk from Play Store
2. Enter ID: `431883450`
3. Enter password
4. Connect

---

## 3. Android Phone - Tailscale Setup

Your phone needs to join the Tailscale network for secure access:

1. Install **Tailscale** from Play Store
2. Open and sign in with same account used on ormus-pop-os
3. Toggle ON to connect
4. Your phone will appear in `tailscale status`

Once connected, you can SSH directly to `100.88.76.14` from your phone.

---

## 4. Wake-on-LAN (If Machine is Off)

If the computer is sleeping/off, you can wake it remotely:

### Check WoL Status
```bash
sudo ethtool eth0 | grep Wake-on
```

### Enable WoL (if not enabled)
```bash
sudo ethtool -s eth0 wol g
```

### Wake from MidnightSun
Use a WoL app or PowerShell:
```powershell
# Install WakeMeOnLan or use wolcmd
# Need the MAC address of ormus-pop-os network interface
```

---

## 5. Troubleshooting

### Can't Connect via Tailscale
```bash
# Check Tailscale status on this machine
tailscale status

# Restart Tailscale
sudo systemctl restart tailscaled
```

### RustDesk Not Responding
```bash
# Check if running
pgrep -a rustdesk

# Restart RustDesk
pkill rustdesk
flatpak run com.rustdesk.RustDesk &
```

### SSH Connection Refused
```bash
# Check SSH service
sudo systemctl status ssh

# Restart if needed
sudo systemctl restart ssh
```

---

## Security Notes

1. **Tailscale** creates an encrypted WireGuard tunnel - all traffic is secure
2. **RustDesk** uses end-to-end encryption by default
3. **SSH** is encrypted; consider key-based auth for extra security
4. This machine is NOT exposed to the public internet - only accessible via Tailscale

---

## Checklist Before Travel

- [x] Set permanent password in RustDesk
- [x] Auto-suspend disabled
- [ ] Install Tailscale on Android phone
- [ ] Install RustDesk on Android phone
- [ ] Test SSH from MidnightSun: `ssh hermeticormus@100.88.76.14`
- [ ] Test RustDesk from MidnightSun

---

*Created: 2025-12-21*
