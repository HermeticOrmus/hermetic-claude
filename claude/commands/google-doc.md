---
description: Create formatted documents for Google Drive (briefs, proposals, READMEs). Workaround for no Google Docs MCP.
---

# Google Doc Creation

Create a formatted HTML document that renders beautifully in browsers and can be used in Google Drive.

## Workflow

1. **Mount Google Drive** (if not already):
   ```bash
   rclone mount "ALQVEMENTS:" ~/GoogleDrive --vfs-cache-mode full --daemon
   ```

2. **Gather from user**:
   - Full document content
   - Target folder path in Drive
   - Any files that need to be linked
   - Brand colors (if applicable)

3. **Create HTML document** with:
   - Clean typography (Segoe UI, max-width 800px)
   - Brand-colored headings
   - Highlight boxes for key info
   - Relative links to other files in same folder
   - Professional styling

4. **Save to Google Drive**:
   ```bash
   cat > ~/GoogleDrive/path/to/folder/Document-Name.html << 'EOF'
   <!-- HTML content -->
   EOF
   ```

5. **Clean up** redundant files - one clear document, not multiple READMEs

## Naming Convention

- `00_READ-ME-FIRST.html` - Primary document (sorts to top)
- `Brief-ProjectName.html` - Project briefs
- `Proposal-ClientName.html` - Proposals

## Linking Assets

Use relative paths for files in same Drive folder:
```html
<a href="subfolder/file.pdf">Asset Name</a>
```

## Template Structure

```html
<!DOCTYPE html>
<html>
<head>
<title>Document Title</title>
<style>
body { font-family: 'Segoe UI', Arial, sans-serif; max-width: 800px; margin: 40px auto; padding: 20px; line-height: 1.6; color: #2D2D2D; }
h1 { color: #D4AF37; border-bottom: 2px solid #D4AF37; padding-bottom: 10px; }
h2 { color: #5D4E37; margin-top: 30px; }
h3 { color: #81B366; }
.highlight { background: #FFF8E7; padding: 15px; border-left: 4px solid #D4AF37; margin: 20px 0; }
.assets { background: #F5F5F5; padding: 20px; border-radius: 8px; }
a { color: #5A8FB9; }
</style>
</head>
<body>
<!-- Content -->
</body>
</html>
```

## Limitations

- Cannot edit existing Google Docs (creates new HTML files)
- rclone sometimes can't delete files - note manual cleanup needed
- Internal links are relative paths, not Google Drive share links
