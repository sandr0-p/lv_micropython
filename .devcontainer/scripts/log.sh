#!/bin/zsh

function log() {

    color='\033[0;34m'
    reset='\033[0m'
    indent='=>'

    if [ "$2" = "info" ]; then
        color='\033[0;34m'
    elif [ "$2" = "error" ]; then
        color='\033[0;31m'
    elif [ "$2" = "success" ]; then
        color='\033[0;32m'
    elif [ "$2" = "warning" ]; then
        color='\033[0;33m'
    else
        color=$reset
    fi

    re='^[0-9]+$'
    if [ $# -eq 3 ] && [[ $3 =~ $re ]]; then
        indent=""
        for i in $(seq 1 $3); do
            indent="${indent}="
        done
        indent="${indent}>"
    fi

    echo "${color}$(date +"%Y-%m-%d %H:%M:%S") ${indent} $1 ${reset}"
}

# Helper to log an STDOUT/STDERR line as an errorinfo message
# Usage: logError [indent]
# Example: echo "Error message" | logError
function logError() {

    # Read STDIN
    read -r line

    # Check of an integer was passed as an argument
    indent=1
    re='^[0-9]+$'
    if [ $# -eq 1 ] && [[ $1 =~ $re ]]; then
        indent=$1
    fi

    log "$line" "error" $indent

}