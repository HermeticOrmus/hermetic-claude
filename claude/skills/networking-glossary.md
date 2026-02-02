---
name: networking-glossary
description: Essential networking terms, protocols, and commands - The 20% that explains 100%
---

# Networking Glossary: The 20% That Explains 100%

> **Philosophy**: Master these core concepts and everything else becomes variations on themes.

---

## THE FOUNDATION: How Data Travels

### The Postal System Analogy

Think of the internet like a global postal system:
- **Your Data** = The letter you want to send
- **IP Address** = The street address
- **MAC Address** = The name on the mailbox
- **Port** = The apartment number
- **Router** = The post office that sorts mail
- **Switch** = The mail carrier for your neighborhood
- **Packets** = Your letter cut into puzzle pieces, sent separately, reassembled at destination

---

## LAYER MODELS: The Blueprint

### OSI Model (7 Layers)
> **ELI5**: Like a 7-floor building where each floor has one job. Data takes the elevator down to leave, up to arrive.

| Layer | Name | What It Does | ELI5 | Key Protocols |
|-------|------|--------------|------|---------------|
| 7 | Application | User interface | The app you see and touch | HTTP, FTP, SSH, DNS |
| 6 | Presentation | Data formatting | Translator - makes data readable | SSL/TLS, JPEG, ASCII |
| 5 | Session | Connection management | Keeps the conversation going | NetBIOS, RPC |
| 4 | Transport | Reliable delivery | Makes sure all puzzle pieces arrive | TCP, UDP |
| 3 | Network | Routing/Addressing | Finds the best route to destination | IP, ICMP, ARP |
| 2 | Data Link | Local delivery | Delivers to the right device on your network | Ethernet, MAC |
| 1 | Physical | Raw bits | Actual cables, signals, electricity | Cables, Wi-Fi signals |

**Memory Trick**: "**P**lease **D**o **N**ot **T**hrow **S**ausage **P**izza **A**way" (bottom to top)

### TCP/IP Model (4 Layers)
> **ELI5**: The simplified, real-world version. Like OSI but practical.

| Layer | Combines OSI | Function |
|-------|--------------|----------|
| Application | 7, 6, 5 | User apps and data format |
| Transport | 4 | TCP or UDP delivery |
| Internet | 3 | IP addressing and routing |
| Network Access | 2, 1 | Physical transmission |

---

## ADDRESSING: Finding Things on Networks

### IP Address
> **ELI5**: Your home's street address. Without it, mail can't find you.

**IPv4**: `192.168.1.100` (4 numbers, 0-255 each)
**IPv6**: `2001:0db8:85a3:0000:0000:8a2e:0370:7334` (8 groups of hex)

**Private IP Ranges** (only work inside your network):
| Range | Class | Typical Use |
|-------|-------|-------------|
| `10.0.0.0 - 10.255.255.255` | A | Large organizations |
| `172.16.0.0 - 172.31.255.255` | B | Medium networks |
| `192.168.0.0 - 192.168.255.255` | C | Home/small office |

**Commands**:
```bash
# Windows
ipconfig                    # Show IP configuration
ipconfig /all              # Detailed info (DNS, DHCP, MAC)
ipconfig /release          # Release DHCP lease
ipconfig /renew            # Request new IP from DHCP

# Linux
ip addr                    # Show IP addresses
ip addr show eth0          # Specific interface
hostname -I                # Quick IP display
```

### MAC Address
> **ELI5**: Your device's fingerprint. Born with it, never changes. Like a serial number burned into hardware.

**Format**: `00:1A:2B:3C:4D:5E` (6 pairs of hex, 48 bits)
- First 3 pairs = Manufacturer (OUI)
- Last 3 pairs = Unique device ID

**Commands**:
```bash
# Windows
getmac                     # Show MAC addresses
ipconfig /all              # Shows "Physical Address"

# Linux
ip link show               # Shows MAC (link/ether)
cat /sys/class/net/eth0/address
```

### Subnet Mask
> **ELI5**: Tells your computer which addresses are "neighbors" (same network) vs "far away" (need router).

**Common Masks**:
| CIDR | Subnet Mask | Usable Hosts | Use Case |
|------|-------------|--------------|----------|
| /8 | 255.0.0.0 | 16 million | Huge networks |
| /16 | 255.255.0.0 | 65,534 | Large networks |
| /24 | 255.255.255.0 | 254 | Typical LAN |
| /30 | 255.255.255.252 | 2 | Point-to-point links |

---

## CORE PROTOCOLS: The 20% You MUST Know

### 1. DHCP (Dynamic Host Configuration Protocol)
> **ELI5**: The "Welcome Wagon" that automatically gives new devices an address, directions to the internet, and local phone book (DNS).

**What it provides automatically**:
- IP Address
- Subnet Mask
- Default Gateway (router)
- DNS Server addresses

**The DORA Process**:
1. **D**iscover - Device shouts "I need an IP!"
2. **O**ffer - DHCP server says "Here's one you can use"
3. **R**equest - Device says "I'll take it!"
4. **A**cknowledge - Server says "It's yours for X hours"

**Commands**:
```bash
# Windows
ipconfig /release          # Give up current IP
ipconfig /renew            # Request new IP

# Linux
sudo dhclient -r           # Release
sudo dhclient              # Request new lease
```

**Port**: UDP 67 (server), UDP 68 (client)

---

### 2. ARP (Address Resolution Protocol)
> **ELI5**: You know someone's name (IP) but need to find their face (MAC). ARP shouts "Who has IP X?" and that device responds with its MAC address.

**Why needed**: IP addresses work for routing, but actual delivery on local network uses MAC addresses. ARP bridges Layer 3 (IP) to Layer 2 (MAC).

**Process**:
1. Device needs to send to `192.168.1.50`
2. Checks ARP cache - "Do I know this MAC?"
3. If not, broadcasts: "Who has 192.168.1.50?"
4. Owner responds: "That's me! My MAC is XX:XX:XX:XX:XX:XX"
5. Stores in ARP cache for future

**Commands**:
```bash
# Windows
arp -a                     # Show ARP cache (IP to MAC mappings)
arp -d *                   # Clear ARP cache

# Linux
arp -a                     # Show cache
ip neigh                   # Modern way to show neighbors
ip neigh flush all         # Clear cache
```

**Security Note**: ARP has no authentication. ARP Spoofing/Poisoning attacks exploit this.

---

### 3. ICMP (Internet Control Message Protocol)
> **ELI5**: The network's "Are you there?" and "Something went wrong" messenger. Like shouting into a canyon to hear the echo.

**Two Main Uses**:
- **Ping**: "Are you alive?" (Echo Request/Reply)
- **Traceroute**: "Show me every stop between us"

**Common ICMP Types**:
| Type | Name | Meaning |
|------|------|---------|
| 0 | Echo Reply | "Yes, I'm here" (ping response) |
| 3 | Destination Unreachable | "Can't reach that" |
| 8 | Echo Request | "Are you there?" (ping) |
| 11 | Time Exceeded | "Packet took too long" (used by traceroute) |

**Commands**:
```bash
# Ping - Test connectivity
ping 8.8.8.8               # Ping Google DNS
ping -c 4 8.8.8.8          # Linux: only 4 pings
ping -n 4 8.8.8.8          # Windows: only 4 pings
ping -t 8.8.8.8            # Windows: continuous until Ctrl+C

# Traceroute - Show path
tracert google.com         # Windows
traceroute google.com      # Linux
traceroute -I google.com   # Linux: use ICMP instead of UDP
```

**What Ping Results Mean**:
- `Reply from X: bytes=32 time=15ms TTL=56` = Success!
- `Request timed out` = No response (blocked or down)
- `Destination unreachable` = Can't route there

---

### 4. DNS (Domain Name System)
> **ELI5**: The internet's phone book. You say "google.com" and DNS tells you "142.250.190.46" because humans remember names, computers need numbers.

**Hierarchy**:
```
.                          # Root (invisible)
com.                       # Top-Level Domain (TLD)
google.com.                # Domain
www.google.com.            # Subdomain (FQDN)
```

**Record Types**:
| Type | Purpose | Example |
|------|---------|---------|
| A | Domain to IPv4 | google.com -> 142.250.190.46 |
| AAAA | Domain to IPv6 | google.com -> 2607:f8b0:4004:... |
| MX | Mail server | google.com mail -> smtp.google.com |
| CNAME | Alias | www.google.com -> google.com |
| TXT | Text info | SPF, DKIM verification |
| NS | Name servers | Who manages this domain |

**Commands**:
```bash
# Windows
nslookup google.com        # Basic lookup
nslookup -type=MX google.com  # Mail servers
ipconfig /displaydns       # Show DNS cache
ipconfig /flushdns         # Clear DNS cache

# Linux
dig google.com             # Detailed lookup
dig google.com MX          # Mail servers
dig +short google.com      # Just the IP
host google.com            # Simple lookup
```

**Port**: UDP 53 (standard), TCP 53 (large responses/zone transfers)

---

### 5. NAT (Network Address Translation)
> **ELI5**: Your whole house shares one phone number. NAT is the receptionist who knows that calls for "extension 101" go to your computer, "extension 102" goes to your phone.

**Why NAT exists**: Not enough public IPv4 addresses for all devices. NAT lets many private IPs share one public IP.

**How it works**:
```
Private Network              NAT Router              Internet
192.168.1.10:4567  ------>  203.0.113.5:12345  --->  Server
192.168.1.11:8901  ------>  203.0.113.5:12346  --->  Server
192.168.1.12:2345  ------>  203.0.113.5:12347  --->  Server
```

Router keeps a table mapping internal IP:Port to external Port.

**Types**:
| Type | Description |
|------|-------------|
| SNAT | Source NAT - Changes source IP (outgoing) |
| DNAT | Destination NAT - Changes destination IP (incoming/port forwarding) |
| PAT | Port Address Translation - Many IPs share one (most common) |

**Commands**:
```bash
# Windows - View NAT table (if applicable)
netstat -an                # Shows connections with ports

# Linux (if using iptables)
sudo iptables -t nat -L    # List NAT rules
```

---

### 6. TCP vs UDP
> **ELI5**:
> - **TCP** = Certified mail. Guaranteed delivery, signature required, slow but reliable.
> - **UDP** = Postcard. Fast, no guarantees, might get lost, but quick for simple stuff.

**Comparison**:
| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | Yes (handshake) | No (just send) |
| Reliability | Guaranteed delivery | Best effort |
| Order | Packets arrive in order | May arrive out of order |
| Speed | Slower (overhead) | Faster (minimal overhead) |
| Use Cases | Web, email, file transfer | Streaming, gaming, DNS |

**TCP Three-Way Handshake**:
```
Client          Server
  |--- SYN --->|      "Want to connect?"
  |<- SYN-ACK -|      "OK, I acknowledge"
  |--- ACK --->|      "Great, connected!"
```

**Common Ports**:
| Port | Protocol | Service |
|------|----------|---------|
| 20-21 | TCP | FTP |
| 22 | TCP | SSH |
| 23 | TCP | Telnet |
| 25 | TCP | SMTP (email) |
| 53 | UDP/TCP | DNS |
| 67-68 | UDP | DHCP |
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |
| 3389 | TCP | RDP |

**Commands**:
```bash
# Windows
netstat -an                # All connections
netstat -abon              # With process names (admin)

# Linux
ss -tuln                   # TCP/UDP listening ports
netstat -tuln              # Same, older command
```

---

### 7. Routing Protocols
> **ELI5**: Routers are like post offices. They need maps to know the best path. Routing protocols are how post offices share their maps with each other.

**Two Categories**:
- **Distance Vector**: "I heard from my neighbor that X is 3 hops away"
- **Link State**: "Here's my complete map of everyone I'm connected to"

**Key Protocols**:
| Protocol | Type | Scope | Key Fact |
|----------|------|-------|----------|
| **RIP** | Distance Vector | Internal | Old, max 15 hops, slow |
| **OSPF** | Link State | Internal | Fast, scalable, uses areas |
| **EIGRP** | Hybrid | Internal | **Cisco proprietary**, fast |
| **BGP** | Path Vector | Internet | Runs THE INTERNET, complex |

**EIGRP** = The one that's Cisco-only (answer to TryHackMe question!)

**Commands**:
```bash
# Windows
route print                # Show routing table
tracert google.com         # Show route taken

# Linux
ip route                   # Show routing table
route -n                   # Older command
traceroute google.com      # Show path
```

---

## ESSENTIAL COMMAND QUICK REFERENCE

### Network Diagnostics Workflow

```bash
# 1. Check your own config
ipconfig /all              # Windows
ip addr && ip route        # Linux

# 2. Check local connectivity
ping 127.0.0.1             # Loopback (yourself)
ping 192.168.1.1           # Gateway (router)

# 3. Check internet connectivity
ping 8.8.8.8               # Google DNS (internet)
ping google.com            # DNS + Internet

# 4. Trace the path
tracert 8.8.8.8            # Windows
traceroute 8.8.8.8         # Linux

# 5. Check DNS
nslookup google.com        # Windows/Linux
dig google.com             # Linux

# 6. Check open connections
netstat -an                # All connections
netstat -abon              # Windows: with process names
ss -tuln                   # Linux: listening ports

# 7. Check ARP cache
arp -a                     # Who's on local network

# 8. Check active services
net start                  # Windows services
systemctl list-units       # Linux services
```

---

## MENTAL MODELS

### The Encapsulation Onion
Data gets wrapped in headers at each layer going down, unwrapped going up:

```
Application: [DATA]
Transport:   [TCP Header][DATA]
Network:     [IP Header][TCP Header][DATA]
Data Link:   [Frame Header][IP Header][TCP Header][DATA][Frame Trailer]
Physical:    01101001001...
```

### The Hotel Analogy
- **IP Address** = Hotel address
- **Port Number** = Room number
- **MAC Address** = Room key
- **Router** = Front desk
- **Switch** = Hallway to rooms
- **Firewall** = Security guard

### Troubleshooting Flow
```
Can't connect?
    |
    v
Ping 127.0.0.1 (loopback) --> Fails? --> TCP/IP stack broken
    |
    v (works)
Ping gateway (192.168.1.1) --> Fails? --> Local network issue
    |
    v (works)
Ping 8.8.8.8 (internet IP) --> Fails? --> Router/ISP issue
    |
    v (works)
Ping google.com (domain) --> Fails? --> DNS issue
    |
    v (works)
Specific site fails? --> That site's problem or firewall
```

---

## FLAGS & ANSWERS FROM TRYHACKME

| Room | Flag | What It Tested |
|------|------|----------------|
| Networking Concepts | `THM{TELNET_MASTER}` | TCP/IP, telnet usage |
| Networking Essentials | `THM{computer_is_happy}` | DHCP, ARP, ICMP, NAT quiz |

---

## THE 20% SUMMARY

**If you only remember 10 things:**

1. **OSI has 7 layers**, TCP/IP has 4 - data goes down to send, up to receive
2. **IP addresses** are logical (can change), **MAC addresses** are physical (permanent)
3. **DHCP** automatically gives devices network settings (IP, gateway, DNS)
4. **ARP** converts IP addresses to MAC addresses for local delivery
5. **DNS** converts domain names to IP addresses
6. **ICMP** is for ping and traceroute - network diagnostics
7. **TCP** = reliable, ordered, slow | **UDP** = fast, unreliable, simple
8. **NAT** lets many private IPs share one public IP
9. **Ports** identify which application gets the data (80=HTTP, 443=HTTPS, 22=SSH)
10. **Routing protocols** help routers find best paths (EIGRP is Cisco-only!)

---

*"The network doesn't lie. Packets go where they're addressed. Understanding addressing is understanding networks."*

**Last Updated**: 2025-12-24
**Source**: TryHackMe Cyber Security 101 - Networking Modules
