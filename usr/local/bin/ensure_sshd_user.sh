#!/bin/bash

# Check if the sshd user exists
if ! id "sshd" &>/dev/null; then
    echo "sshd user not found. Adding..."
    # Add the sshd user with no home directory, no login shell, and in the system users' range
    useradd -r -M -d /var/run/sshd -s /bin/false sshd
    echo "sshd user added successfully."
else
    echo "sshd user already exists."
fi

