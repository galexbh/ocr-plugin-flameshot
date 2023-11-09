# Flameshot OCR Script

## Description
This script provides an easy and convenient way to capture screenshots and extract text using OCR (Optical Character Recognition) with Flameshot, Tesseract, and xclip. It is designed for Linux users and supports multiple desktop environments.

## How to Use
To use this script, follow these steps:

1. **Clone the Repository:**
    ```bash
    git clone git@github.com:galexbh/ocr-plugin-flameshot.git
    ```

2. **Change Directory:**
    ```bash
    cd ocr-plugin-flameshot
    ```

3. **Execute Install Script:**
    ```bash
    chmod +x install.sh
    ```

4. **Execute Install Script:**
    ```bash
    ./install.sh
    ```

## OCR Script Location
Post-installation, find the OCR script (flameshot_ocr.sh) in ~/.ocr/.

## Language Configuration
Default OCR language is Spanish. To switch languages:

1. Change the language package in install.sh from `tesseract-data-spa` to `tesseract-data-eng`.

2. Modify flameshot_ocr.sh, changing `-l spa` to `-l eng`:
    ```bash
    tesseract "$TEMPFILE" stdout -l eng | xclip -selection clipboard
    ```

## Keyboard Shortcut Setup


### For KDE Plasma

1. Navigate to "System Settings" → "Shortcuts".
2. Choose "Custom Shortcuts", click "Edit" → "New" → "Global Shortcut" → "Command/URL".
3. Name it "OCR with Flameshot".
4. Assign `Meta + Shift + T` as the trigger.
5. For "Action", input /home/your_username/.ocr/flameshot_ocr.sh.

### For XFCE
1. Access "Settings" → "Keyboard" → "Application Shortcuts".
2. Click "Add" and input /home/your_username/.ocr/flameshot_ocr.sh.
3. Assign `Meta + Shift + T` when prompted.

### For GNOME

1. Go to "Settings" → "Keyboard/Keyboard Shortcuts".
2. Click "+" to add a new shortcut.
3. Set "Name" to "OCR with Flameshot", "Command" to /home/your_username/.ocr/flameshot_ocr.sh.
4. Assign the shortcut `Meta + Shift + T`.