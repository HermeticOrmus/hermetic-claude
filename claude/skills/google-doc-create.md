---
name: google-doc-create
description: Create formatted documents for Google Drive that render as rich documents. Use when user needs a Google Doc created, a brief, proposal, or formatted document in their Drive.
triggers:
  - create a google doc
  - make a document
  - write a brief
  - create a proposal
  - formatted document for drive
---

# Google Doc Creation via HTML

Claude cannot directly edit Google Docs (no MCP tool available). This skill creates well-formatted HTML files that:
1. Render beautifully in any browser
2. Can be opened/converted in Google Drive
3. Support internal links to other Drive files

## Prerequisites

Google Drive must be mounted via rclone:
```bash
# Check if mounted
ls ~/GoogleDrive

# If not mounted
rclone mount "ALQVEMENTS:" ~/GoogleDrive --vfs-cache-mode full --daemon
```

## Workflow

### 1. Gather Content
- Get all text content from user
- Identify what assets/files need to be linked
- Note the target folder path in Google Drive

### 2. Create HTML Document

```html
<!DOCTYPE html>
<html>
<head>
<title>Document Title</title>
<style>
body {
  font-family: 'Segoe UI', Arial, sans-serif;
  max-width: 800px;
  margin: 40px auto;
  padding: 20px;
  line-height: 1.6;
  color: #2D2D2D;
}
h1 { color: #D4AF37; border-bottom: 2px solid #D4AF37; padding-bottom: 10px; }
h2 { color: #5D4E37; margin-top: 30px; }
h3 { color: #81B366; }
.highlight {
  background: #FFF8E7;
  padding: 15px;
  border-left: 4px solid #D4AF37;
  margin: 20px 0;
}
a { color: #5A8FB9; }
ul, ol { margin: 10px 0; }
li { margin: 5px 0; }
</style>
</head>
<body>

<!-- Content here -->

</body>
</html>
```

### 3. Link to Other Files

Use relative paths for files in the same Drive folder:
```html
<a href="01_ASSETS/file.pdf">Download Asset</a>
<a href="subfolder/image.png">View Image</a>
```

For external links:
```html
<a href="https://example.com">External Link</a>
<a href="mailto:hello@example.com">Email Us</a>
```

### 4. Save to Google Drive

```bash
# Save HTML file to mounted Google Drive
cat > ~/GoogleDrive/path/to/folder/Document-Name.html << 'EOF'
<!-- HTML content -->
EOF
```

### 5. Naming Convention

Use clear, action-oriented names:
- `00_READ-ME-FIRST.html` - Primary document
- `Brief-ProjectName.html` - Project briefs
- `Proposal-ClientName.html` - Proposals

## Template: Project Brief

```html
<!DOCTYPE html>
<html>
<head>
<title>Project Brief - [NAME]</title>
<style>
body { font-family: 'Segoe UI', Arial, sans-serif; max-width: 800px; margin: 40px auto; padding: 20px; line-height: 1.6; }
h1 { color: #D4AF37; border-bottom: 2px solid #D4AF37; }
h2 { color: #5D4E37; margin-top: 30px; }
.highlight { background: #FFF8E7; padding: 15px; border-left: 4px solid #D4AF37; margin: 20px 0; }
.assets { background: #F5F5F5; padding: 20px; border-radius: 8px; }
a { color: #5A8FB9; }
</style>
</head>
<body>

<h1>[Project Name] - Creative Brief</h1>

<h2>Project Overview</h2>
<p><strong>Project:</strong> [Description]<br>
<strong>Client:</strong> [Client Name]<br>
<strong>Website:</strong> <a href="https://example.com">example.com</a></p>

<h2>Objectives</h2>
<ul>
<li>[Objective 1]</li>
<li>[Objective 2]</li>
</ul>

<h2>Deliverables</h2>
<ul>
<li>[Deliverable 1]</li>
<li>[Deliverable 2]</li>
</ul>

<h2>Assets Provided</h2>
<div class="assets">
<p>✅ <a href="folder/file.ext"><strong>Asset Name</strong></a> - Description<br>
✅ <a href="folder/file2.ext"><strong>Asset 2</strong></a> - Description</p>
</div>

<h2>Timeline</h2>
<p>[Timeline details]</p>

<h2>Contact</h2>
<p><a href="mailto:email@example.com">email@example.com</a></p>

</body>
</html>
```

## Cleanup Old Files

rclone sometimes can't delete files. Note for user:
```
Manual cleanup needed in Google Drive:
- Delete [filename] (rclone limitation)
```

## Limitations

- Cannot edit existing Google Docs (only create new HTML files)
- Internal Drive links work as relative paths, not as Google Drive sharing links
- User may need to manually delete old files in Google Drive web interface
- For true Google Doc editing, user needs to copy-paste content or use Google Docs directly

## Best Practices

1. **Single source of truth** - One main document, not multiple READMEs
2. **Clear naming** - Prefix with numbers for sort order (00_, 01_, etc.)
3. **Embedded links** - Link to assets where mentioned, not in separate section
4. **Professional styling** - Use brand colors when known
5. **Action-oriented** - Name files by what user should do ("READ-ME-FIRST")
