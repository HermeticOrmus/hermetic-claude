---
description: Create a well-crafted git commit with AI-generated message
---

# Smart Git Commit

Please help me create a git commit with a well-crafted conventional commit message.

Steps:
1. Review `git status` to see what's staged
2. Examine `git diff --staged` to understand changes
3. Generate a conventional commit message following this format:
   ```
   <type>(<scope>): <subject>

   <body>

   <footer>
   ```

Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build, revert

Make the subject line concise (<50 chars), use imperative mood, no period at end.
Body should explain WHAT and WHY, not HOW.
Include breaking changes in footer if applicable.

After generating the message, create the commit.
