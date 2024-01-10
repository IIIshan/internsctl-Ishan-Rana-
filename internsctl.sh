#!/bin/bash

# internsctl - Custom Linux command v0.1.0

# Function to display help
display_help() {
    echo "Usage: internsctl [OPTIONS] COMMAND [ARGS]"
    echo "Custom Linux command for various operations."
    echo
    echo "Options:"
    echo "  --help            Display this help message"
    echo "  --version         Display command version"
    echo
    echo "Commands:"
    echo "  cpu getinfo       Get CPU information"
    echo "  memory getinfo    Get memory information"
    echo "  user create       Create a new user"
    echo "  user list         List all regular users"
    echo "  user list --sudo-only List users with sudo permissions"
    echo "  file getinfo      Get information about a file"
}

# Function to display version
display_version() {
    echo "internsctl v0.1.0"
}

# Function to get CPU information
get_cpu_info() {
    lscpu
}

# Function to get memory information
get_memory_info() {
    free
}

# Function to create a new user
create_user() {
    if [ $# -eq 0 ]; then
        echo "Error: Missing username. Usage: internsctl user create <username>"
        exit 1
    fi

    username=$1
    sudo adduser --home "/home/$username" --disabled-password --gecos "" "$username"
}

# Function to list all regular users or users with sudo permissions
list_users() {
    if [ "$1" == "--sudo-only" ]; then
        grep -E 'sudo|admin' /etc/group | cut -d: -f4 | tr ',' '\n'
    else
        cut -d: -f1 /etc/passwd
    fi
}

# Function to get information about a file
get_file_info() {
    if [ $# -eq 0 ]; then
        echo "Error: Missing filename. Usage: internsctl file getinfo [options] <file-name>"
        exit 1
    fi

    filename=$1

    # Check if the filename is provided as an option
    if [ "${filename:0:1}" == "-" ]; then
        echo "Error: Missing filename. Usage: internsctl file getinfo [options] <file-name>"
        exit 1
    fi

    # Parse options
    size_option=false

    while [ "$#" -gt 1 ]; do
        case "$2" in
            --size | -s)
                size_option=true
                ;;
            --permissions | -p)
                stat -c "File: %n%nAccess: %A%nSize(B): %s%nOwner: %U%nModify: %y" "$filename"
                exit 0
                ;;
            --owner | -o)
                stat -c "File: %n%nOwner: %U" "$filename"
                exit 0
                ;;
            --last-modified)
                stat -c "File: %n%nModify: %y" "$filename"
                exit 0
                ;;
            *)
                echo "Error: Unknown option '$2'."
                display_help
                exit 1
                ;;
        esac
        shift
    done

    # If --size option is selected, display only the size
    if [ "$size_option" = true ]; then
        stat -c "%s" "$filename"
    else
        stat -c "File: %n%nAccess: %A%nSize(B): %s%nOwner: %U%nModify: %y" "$filename"
    fi
}

# Main script logic
case "$1" in
    cpu)
        shift
        case "$1" in
            getinfo)
                get_cpu_info
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    memory)
        shift
        case "$1" in
            getinfo)
                get_memory_info
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    user)
        shift
        case "$1" in
            create)
                shift
                create_user "$@"
                ;;
            list)
                shift
                list_users "$@"
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    file)
        shift
        case "$1" in
            getinfo)
                shift
                get_file_info "$@"
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    --help)
        display_help
        ;;
    --version)
        display_version
        ;;
    *)
        display_help
        ;;
esac

