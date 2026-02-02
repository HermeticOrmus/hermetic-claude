---
description: Diagnose system issues and problems
thinking: true
---

# System Diagnosis

I'm experiencing a system issue. Please help me diagnose and fix it.

Diagnostic steps:
1. **Describe the problem**: What's happening? When did it start?
2. **Gather information**:
   - System logs: `journalctl -xe`
   - Specific service logs: `systemctl status <service>`
   - Resource usage: `top`, `htop`, `df -h`
   - Network: `ip addr`, `ping`, `netstat`
3. **Identify patterns**: Is it consistent or intermittent?
4. **Check recent changes**: What changed recently?
5. **Research**: Look for known issues
6. **Test hypotheses**: Verify potential causes
7. **Implement fix**: Apply solution
8. **Verify**: Confirm issue is resolved

Be systematic and thorough. Document findings for future reference.
