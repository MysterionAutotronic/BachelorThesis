#!/bin/sh

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    echo -n "Installing... "
    while kill -0 $pid 2>/dev/null; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    echo ""
}

progress_message() {
    echo -e "\n\033[1;34m$1...\033[0m"
}

progress_message "Starting LaTeX installation"

# Update package list in the background
sudo apt update > /dev/null 2>&1 &
spinner $!

# APT install
progress_message "Installing required APT packages"
sudo apt install -y texlive-full pandoc biber lmodern imagemagick flatpak inkscape tree python3-pygments python3-pip python3-venv 2>&1 | tee install.log &
spinner $!

# flatpak install
progress_message "Installing required flatpak packages"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.jabref.jabref
spinner $!

# pygments upgrade for tsx
progress_message "Upgrading Pygments for TSX support"
python3 -m venv ~/.venvs/latex
~/.venvs/latex/bin/pip install -U Pygments

# Check for success
if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32mInstallation completed successfully!\033[0m"
else
    echo -e "\n\033[1;31mInstallation failed. Check install.log for details.\033[0m"
fi
