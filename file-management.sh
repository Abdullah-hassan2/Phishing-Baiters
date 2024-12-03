#!/bin/bash

# Color Codes
RED='\033[0;31m'  # Red
GREEN='\033[0;32m'  # Green
YELLOW='\033[1;33m'  # Yellow
BLUE='\033[0;34m'  # Blue
NC='\033[0m'      # No Color (reset)

# Welcome Message in Red
clear
echo -e "${RED}*************************************************"
echo -e "**********   PHISHING BAITERS TOOL   ************"
echo -e "*************************************************"
echo -e "${NC}"  # Reset color
echo -e "${RED}Welcome to Phishing Baiters!${NC}"

# Menu in Green
function display_menu() {
    echo -e "${GREEN}File Management System"
    echo -e "1. View the list of files in the current directory"
    echo -e "2. Create a new file"
    echo -e "3. Delete an existing file"
    echo -e "4. Search for a file by name"
    echo -e "5. Clear the screen"
    echo -e "6. Create a new directory"
    echo -e "7. Count files and folders"
    echo -e "8. Show the current directory"
    echo -e "9. Exit${NC}"
}

# View Files Function
function view_files() {
    echo -e "${YELLOW}Files in the current directory:${NC}"
    ls -1
}

# Create File Function
function create_file() {
    read -p "Enter the name of the new file: " filename
    if [ -e "$filename" ]; then
        echo -e "${RED}File '$filename' already exists.${NC}"
    else
        touch "$filename"
        echo -e "${GREEN}File '$filename' created.${NC}"
    fi
}

# Delete File Function
function delete_file() {
    read -p "Enter the name of the file to delete: " filename
    if [ -e "$filename" ]; then
        rm "$filename"
        echo -e "${GREEN}File '$filename' deleted.${NC}"
    else
        echo -e "${RED}File '$filename' does not exist.${NC}"
    fi
}

# Search File Function
function search_file() {
    read -p "Enter the name of the file to search: " filename
    if [ -e "$filename" ]; then
        echo -e "${GREEN}File '$filename' found.${NC}"
    else
        echo -e "${RED}File '$filename' not found.${NC}"
    fi
}

# Clear Screen Function
function clear_screen() {
    clear
    echo -e "${YELLOW}Screen cleared!${NC}"
}

# Create Directory Function
function create_directory() {
    read -p "Enter the name of the new directory: " dirname
    if [ -d "$dirname" ]; then
        echo -e "${RED}Directory '$dirname' already exists.${NC}"
    else
        mkdir "$dirname"
        echo -e "${GREEN}Directory '$dirname' created.${NC}"
    fi
}

# Count Files and Folders Function
function count_files_folders() {
    files=$(ls -l | grep -v '^d' | wc -l)
    directories=$(ls -l | grep '^d' | wc -l)
    echo -e "${YELLOW}There are $files files and $directories directories in the current directory.${NC}"
}

# Show Current Directory Function
function show_current_directory() {
    echo -e "${BLUE}Current directory: $(pwd)${NC}"
}

# Main Menu Loop
while true; do
    display_menu
    read -p "Choose an option [1-9]: " choice
    case $choice in
        1) view_files ;;
        2) create_file ;;
        3) delete_file ;;
        4) search_file ;;
        5) clear_screen ;;
        6) create_directory ;;
        7) count_files_folders ;;
        8) show_current_directory ;;
        9) echo -e "${GREEN}Exiting the file management system.${NC}"; exit 0 ;;
        *) echo -e "${RED}Invalid option. Please try again.${NC}" ;;
    esac
done
