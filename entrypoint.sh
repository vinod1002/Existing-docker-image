#!/bin/bash
set -e

# Install the Python dependencies
if [ -n "$1" ]; then
    pip3 install $1
    echo "python_dependencies_installed=true" >> $GITHUB_ENV
else
    echo "No python dependencies specified"
    echo "python_dependencies_installed=false" >> $GITHUB_ENV
fi
