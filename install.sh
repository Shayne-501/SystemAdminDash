#!/bin/bash

install_dir="/opt/admin_dashboard"
bin_link="user/local/bin/admin_dashboard"

check_command() {
	if ! command -v "$1" &> /dev/null; then
		echo "Error: $1 is not available or installed"
		missing=true
	fi
}

echo "Going through dependencies"

missing=false
check_command bash
check_command git
check_command curl
check_command ip

if [ "missing" = true ]; then
	echo "WARNING! Please insiall the missing or latest dependencies before running this script"
	exit 1
fi

echo "Creating install directory at $install_dir"
sudo mkdir -p "$install_dir"

echo "Copying..."
sudo cp -r ./* "$install_dir"

sudo chmod +x "$install_dir/admin_dashboard.sh"

echo "Creating a command shortcut..."
sudo ln -sf "$install_dir/admin_dashboard.sh" "$bin_link"

echo "All done! You can run the System Administrator Dashbaord now!"
