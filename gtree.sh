#!/bin/bash

# Default settings
PARENT_DEPTH=1
CHILD_DEPTH=2

# ASCII art for the header
function display_header() {
    cat << 'AUTHOR_BLOCK'

#########################################################################################
#        _                       _ _               _                           _   _ _  #
#   __ _| |_ _ __ ___  ___    __| (_)_ __ ___  ___| |_ ___  _ __ _   _   _   _| |_(_) | #
#  / _` | __| '__/ _ \/ _ \  / _` | | '__/ _ \/ __| __/ _ \| '__| | | | | | | | __| | | #
# | (_| | |_| | |  __/  __/ | (_| | | | |  __/ (__| || (_) | |  | |_| | | |_| | |_| | | #
#  \__, |\__|_|  \___|\___|  \__,_|_|_|  \___|\___|\__\___/|_|   \__, |  \__,_|\__|_|_| #
#  |___/                                                         |___/                  #
#########################################################################################                
             # gtree - Directory Tree Viewer Tool                    #
             # Author: Aaron Galipeau                                #
             # License: MIT License                                  #
             # Description:                                          #
             # This script generates a directory tree view for a     #
             # given directory, allowing customization for how many  #
             # parent directories and child directories are visible. #
             # It includes command-line options and an interactive   #
             # menu to select the depth of directories shown.        #
             #                                                       #   
             # Usage: gtree --[OPTIONS]                              #
             # --help: Show help menu                                #
             # --menu: Interactive menu to select tree depth         # 
             #########################################################

AUTHOR_BLOCK
    }

# Function to display help menu
function show_help() {
    display_header
    echo "Usage: gtree [OPTIONS]"
    echo "Generate a tree of directories with flexible parent and child depth control."
    echo
    echo "Options:"
    echo "  --help               Show this help message and exit"
    echo "  --menu               Interactive menu to select tree depth"
    echo "  --p0                 No parent directory visible"
    echo "  --p1                 One parent directory visible (default)"
    echo "  --p2                 Two parent directories visible"
    echo "  --c1                 Show one child layer"
    echo "  --c2                 Show two child layers (default)"
    echo "  --c3                 Show three child layers"
    echo "  --c4                 Show four child layers (not advised)"
    echo
    echo "Authored by Aaron Galipeau © $(date +'%Y')"
    exit 0
}

# Function to show the interactive menu
function show_menu() {
    display_header
    echo "gtree Menu:"
    echo "1. Chain arguments (set both parent and child depth)"
    echo "2. Select parent depth (p0, p1, p2)"
    echo "3. Select child depth (c1, c2, c3, c4)"
    echo "4. Exit"
    read -p "Choose an option: " MENU_CHOICE
    
    case "$MENU_CHOICE" in
        1)
            read -p "Parent depth (0-2): " PARENT_DEPTH
            read -p "Child depth (1-4): " CHILD_DEPTH
            ;;
        2)
            read -p "Parent depth (0-2): " PARENT_DEPTH
            ;;
        3)
            read -p "Child depth (1-4): " CHILD_DEPTH
            ;;
        4)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid option."
            exit 1
            ;;
    esac
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help)
            show_help
            ;;
        --menu)
            show_menu
            ;;
        --p0)
            PARENT_DEPTH=0
            ;;
        --p1)
            PARENT_DEPTH=1
            ;;
        --p2)
            PARENT_DEPTH=2
            ;;
        --c1)
            CHILD_DEPTH=1
            ;;
        --c2)
            CHILD_DEPTH=2
            ;;
        --c3)
            CHILD_DEPTH=3
            ;;
        --c4)
            CHILD_DEPTH=4
            echo "Warning: Displaying 4 child layers may cause performance issues."
            ;;
        *)
            echo "Unknown argument: $1"
            show_help
            ;;
    esac
    shift
done

# Function to generate tree
function generate_tree() {
    echo
    display_header
    echo "Generating tree for directory $(pwd) with parent depth $PARENT_DEPTH and child depth $CHILD_DEPTH..."
    echo

    # Start from the current directory
    START_DIR=$(pwd)

    # Show the parent directory based on depth
    if [[ "$PARENT_DEPTH" -eq 1 ]]; then
        echo "Parent Directory: $(basename $(dirname "$START_DIR"))"
    elif [[ "$PARENT_DEPTH" -eq 2 ]]; then
        echo "Grandparent Directory: $(basename $(dirname $(dirname "$START_DIR")))"
    fi

    # Generate child directory tree based on the specified depth
    find . -mindepth 1 -maxdepth "$CHILD_DEPTH" -print | awk '{
        indent = gsub(/\//, "/") - 1;
        for (i = 0; i < indent; i++) {
            printf("   ");
        }
        print "|-- " $0
    }'

    echo
    echo "Tree generation complete. Authored by Aaron Galipeau © $(date +'%Y')"
    echo
}

# Call the generate_tree function
generate_tree
