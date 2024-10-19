#!/bin/bash

# Read the Downloads directory
    DOWNLOADS_DIR=$(xdg-user-dir DOWNLOAD)

# Initialize a variable to store the found .deb file
    installer=""

# Use find to search recursively for a installer inside Downloads directory
    installer=$(find "$DOWNLOADS_DIR" -type f -name '*Packet*Tracer*.deb' -print -quit)

# Check if a file was found
    if [[ -z "$installer" ]];
        then
            echo "No matching .deb file found. Please use the link in the GitHub repository and save it in your Downloads directory"
            exit 1
    fi

# Use ar to list the contents of the found .deb file
    echo "Listing the contents of the .deb file:"
    ar t "$installer"

# Create work-in-progress directory
    mkdir cisco

# Extract the .deb archive into the "cisco" directory
    ar x "$installer" --output "cisco"

# Extract data.tar.xz with verbose output to the 'cisco' directory
    echo "Extracting data.tar.xz to the 'cisco' directory"
    tar -xvf cisco/data.tar.xz -C cisco

# Extract control.tar.xz with verbose output to the 'cisco' directory
    echo "Extracting control.tar.xz to the 'cisco' directory"
    tar -xvf cisco/control.tar.xz -C cisco

    # Prompt the user for confirmation
    echo "Be advised! You are about to copy 'opt/' and 'usr/' directories to '/'."
    echo "This may overwrite existing system files. If unsure, check the contents of '/opt' and '/usr' first."
    read -p "Do you want to proceed with the installation? (Y/n): " choice

# Check the user's response
    if [[ "$choice" == "y" || "$choice" == "Y" ]];
        then
            echo "Copying 'opt/' and 'usr/' directories to '/'..."
            sudo cp -rv cisco/opt /
            sudo cp -rv cisco/usr /

                # Run postinst script
                sudo ./cisco/postinst

                # Get rid of work-in-progress directory to save space
                echo "Removing 'cisco' directory to save space..."
                sudo rm -rf cisco
    else
        # If the user chooses not to continue, clean up the 'cisco' directory
            echo "Installation aborted. Removing 'cisco' directory..."
            sudo rm -rf cisco
    fi
