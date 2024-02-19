#!/bin/bash

# install packages depending on the package manager
install_packages() {
    local packages="$1"
    case "$2" in
        apt-get)
            sudo add-apt-repository universe -y
            sudo apt-get update
            local packages_universe=$(echo "$packages" | sed -e 's/tesseract /tesseract-ocr /g' -e 's/tesseract-data-spa/tesseract-ocr-spa/g')
            sudo apt-get install -y $packages_universe
            ;;
        dnf)
            sudo dnf install -y $packages
            ;;
        pacman)
            sudo pacman -S --noconfirm $packages
            ;;
        *)
            echo "Package manager not supported."
            exit 1
            ;;
    esac
}

# Detect the package manager
if command -v apt-get &>/dev/null; then
    package_manager="apt-get"
elif command -v dnf &>/dev/null; then
    package_manager="dnf"
elif command -v pacman &>/dev/null; then
    package_manager="pacman"
else
    echo "No compatible package manager found."
    exit 1
fi

# Install Flameshot, Tesseract, and xclip
install_packages "flameshot tesseract tesseract-data-spa xclip" $package_manager

# Create the directory if it does not exist
mkdir -p ~/.ocr

# Create the flameshot_ocr.sh script
cat > ~/.ocr/flameshot_ocr.sh << 'EOF'
#!/bin/bash

TEMPFILE="$(mktemp /tmp/screenshot-XXXXXX.png)"
flameshot gui --raw > "$TEMPFILE"
if [ -s "$TEMPFILE" ]; then
    tesseract "$TEMPFILE" stdout -l spa | xclip -selection clipboard
    echo "Text copied to clipboard."
    rm "$TEMPFILE"
else
    echo "No screenshot was taken."
    rm "$TEMPFILE"
fi
EOF

# Grant necessary permissions
chmod +x ~/.ocr/flameshot_ocr.sh

echo "Installation completed. The script is located in ~/.ocr/flameshot_ocr.sh"
