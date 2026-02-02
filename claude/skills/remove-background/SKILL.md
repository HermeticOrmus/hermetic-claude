---
name: remove-background
description: Remove backgrounds from images using rembg. Use when user has images with backgrounds that need to be transparent, wants to batch process images, or needs PNGs with alpha channels.
triggers:
  - remove background
  - transparent background
  - remove bg
  - rembg
  - make transparent
  - batch background removal
  - png with transparency
version: 1.0.0
---

# Remove Background

Batch remove backgrounds from images using rembg (Python library).

## When This Skill Activates

- User says "remove background", "make transparent"
- User has images that need transparent backgrounds
- User wants to batch process multiple images

## Prerequisites

rembg must be installed:
```bash
pip install rembg
# or
pipx install rembg
```

Verify installation:
```bash
rembg --version
```

## How To Use

### Single Image

```bash
rembg i INPUT.png OUTPUT.png
```

### Batch Process Directory

**IMPORTANT**: Never output to the same file - use a separate output directory to avoid corruption.

```bash
# Create backup first
mkdir -p backup && cp *.png backup/

# Process to separate folder
mkdir -p processed
for img in *.png; do
  echo "Processing: $img"
  rembg i "$img" "processed/$img"
done

# Verify results, then replace originals
mv processed/*.png . && rmdir processed
```

### Process Entire Folder (rembg native)

```bash
rembg p INPUT_DIR OUTPUT_DIR
```

## Output Format

- Input: Any image (PNG, JPG, WEBP)
- Output: PNG with RGBA (alpha channel for transparency)

## Example Workflows

### Web Assets
```bash
cd ~/projects/my-app/public/images
mkdir -p transparent
for img in *.png; do rembg i "$img" "transparent/$img"; done
```

### Product Photos
```bash
cd ~/products/photos
mkdir -p cutout
rembg p . cutout/
```

## Models Available

rembg supports different AI models:

| Model | Quality | Speed | Use Case |
|-------|---------|-------|----------|
| u2net (default) | Good | Fast | General purpose |
| u2net_human_seg | Better | Medium | People/portraits |
| silueta | Good | Fast | Similar to u2net |
| isnet-general-use | Best | Slower | Complex backgrounds, pixel art, illustrations |

**Recommended for pixel art/illustrations:** `isnet-general-use`

Specify model:
```bash
rembg i -m isnet-general-use input.png output.png
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Empty output file | Don't use same input/output path - use separate folder |
| Slow first run | Model downloading, wait for it |
| Memory error | Process fewer images at once |
| Poor quality | Try different model with `-m` flag |

## Pro Tips

1. **Always backup** before batch processing
2. **Process to separate folder** first, verify, then replace
3. **Use `-a` flag** to keep alpha if image already has transparency
4. **Post-process** in image editor for fine edges if needed
