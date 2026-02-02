---
name: thm-glossary
description: Search or add terms to TryHackMe security glossary
---

# TryHackMe Glossary Manager

Search for terms or add new ones to the security glossary.

## Commands

### Search for a term
```
/thm-glossary <term>
```

Search across all glossary files in `~/projects/tryhackme/glossary/`

### Add a new term
```
/thm-glossary add <term>: <definition>
```

Automatically determines the correct file based on term type.

## Glossary Files

| File | Topics |
|------|--------|
| `networking.md` | Protocols, scanning, network attacks |
| `web.md` | OWASP, web exploitation, XSS, SQLi |
| `linux.md` | Privilege escalation, enumeration |
| `windows.md` | AD, Windows privesc |
| `tools.md` | Nmap, Burp, Metasploit, etc. |
| `crypto.md` | Hashing, encryption, PKI |
| `methodology.md` | Pentesting phases, frameworks |

## Example Usage

```
/thm-glossary SUID
# Returns: SUID - Set User ID - executable runs with owner's privileges

/thm-glossary add MITRE ATT&CK: Framework cataloging adversary tactics, techniques, and procedures
# Adds to methodology.md
```
