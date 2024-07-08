
#!/bin/bash

# Update package lists
sudo apt update

# Install unattended-upgrades package
sudo apt install -y unattended-upgrades

# Configure unattended-upgrades
sudo tee /etc/apt/apt.conf.d/50unattended-upgrades <<EOF
Unattended-Upgrade::Allowed-Origins {
        "\${distro_id}:\${distro_codename}-security";
        "\${distro_id}:\${distro_codename}-updates";
};
EOF

# Enable and start unattended-upgrades service
sudo systemctl enable unattended-upgrades
sudo systemctl start unattended-upgrades

echo "Automatic updates configured and enabled."
