#!/bin/bash
# Install brave-browser from terminal
## (script from https://brave.com/linux/#fedora-28-centosrhel-8)

echo ""
echo "sudo dnf install dnf-plugins-core"
sudo dnf install dnf-plugins-core
echo ""
echo "sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/"
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
echo ""
echo "sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc"
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
echo ""
echo "sudo dnf install brave-browser"
sudo dnf install brave-browser
