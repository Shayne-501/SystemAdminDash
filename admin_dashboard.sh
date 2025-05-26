#!/bin/bash

VERSION=="1.0"

show_main_menu() {
	echo "============================================"
	echo " Admin Dashboard v$VERSION"
	echo "============================================"
	echo "1. System Information"
	echo "2. User Management"
	echo "3. Exit"
	echo "==========================================="
	read -p "Choose an option: " choice

	case $choice in
		1] ./modules/system_info.sh ;;
		2] ./modules/user_mngmt.sh ;;
		3] exit 0 ;;
		*] echo "Invalid option"; sleep 1; show_main_menu ;;
	esac

}

show_main_menu
