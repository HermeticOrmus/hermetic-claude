---
description: Pull the latest recording from connected Pixel phone and transcribe it with Whisper. Use when user wants to transcribe voice memos, recordings, or audio from their phone.
---

# Phone Transcribe

Pull and transcribe the latest recording from a connected Android phone.

## Prerequisites

- Phone connected via USB with USB debugging enabled
- ADB authorized on the phone (accept the prompt when connecting)
- Whisper installed (`pip install openai-whisper`)

## Workflow

### 1. Verify Phone Connection

```bash
adb devices
```

If the device shows "unauthorized", instruct the user to accept the USB debugging prompt on their phone.

### 2. Find Latest Audio Recording

Search common recording locations:

```bash
# Google Recorder app
adb shell "ls -lt /sdcard/Android/media/com.google.android.apps.recorder/Recorder/ 2>/dev/null | head -5"

# WhatsApp audio (personal and business)
adb shell "ls -laR /sdcard/Android/media/ 2>/dev/null | grep -i -E '\.(m4a|mp3|wav|ogg)$' | sort -k6,7 | tail -10"

# Downloads folder
adb shell "ls -lt /sdcard/Download/*.m4a /sdcard/Download/*.mp3 /sdcard/Download/*.wav 2>/dev/null | head -5"

# Voice Recorder / Recordings folder
adb shell "ls -lt /sdcard/Recordings/ 2>/dev/null | head -5"
```

### 3. Pull the Recording

```bash
mkdir -p /tmp/phone-transcribe
adb pull "<full_path_to_audio>" /tmp/phone-transcribe/
```

### 4. Transcribe with Whisper

```bash
whisper /tmp/phone-transcribe/<filename> \
  --model base \
  --output_dir /tmp/phone-transcribe \
  --output_format txt
```

**Model options**:
- `tiny`: Fastest, lower accuracy
- `base`: Good balance (default)
- `small`: Better accuracy
- `medium`: High accuracy
- `large`: Best accuracy, slowest

**Language detection**: Whisper auto-detects language. Use `--language en` to force English.

### 5. Output

Display the transcription to the user and note:
- Source file and timestamp
- Detected language
- Duration
- Any quality issues

## Optional Arguments

- `$ARGUMENTS` can specify:
  - `--model <size>`: Override whisper model (tiny/base/small/medium/large)
  - `--language <code>`: Force specific language (en, es, etc.)
  - `--all`: Transcribe all recordings from today
  - Path pattern to filter specific recordings

## Example Usage

```
/phone-transcribe
/phone-transcribe --model medium
/phone-transcribe --language es
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Device unauthorized | Accept USB debugging prompt on phone |
| No device found | Check USB cable, enable USB debugging in Developer Options |
| Permission denied | May need to unlock phone or grant file access |
| Whisper not found | `pip install openai-whisper` |
| ffmpeg error | `sudo apt install ffmpeg` |
