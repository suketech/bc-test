#!/bin/bash
# Git push helper script using GitHub token from .env
cd /home/sk-gamma/projects/bc-test

# Load environment variables
source .env

if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN not found in .env file"
    exit 1
fi

# Set remote URL with token
git remote set-url origin https://${GITHUB_TOKEN}@github.com/suketech/bc-test.git

# Push to GitHub
git push -u origin main

# Remove token from remote URL for security
git remote set-url origin https://github.com/suketech/bc-test.git

echo "Push completed successfully!"
