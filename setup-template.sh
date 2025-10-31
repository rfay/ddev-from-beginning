#!/bin/bash

# Setup script for presentation template
# This script customizes the template for a new presentation

set -e

echo "🎯 Presentation Template Setup"
echo "==============================="
echo

# Get the current repository name from git remote
REPO_URL=$(git config --get remote.origin.url || echo "")
if [ -n "$REPO_URL" ]; then
    # Extract repo name from URL (works for both HTTPS and SSH)
    REPO_NAME=$(echo "$REPO_URL" | sed -e 's/.*[:/]\([^/]*\/[^/]*\)\.git$/\1/' -e 's/.*[:/]\([^/]*\/[^/]*\)$/\1/')
    OWNER=$(echo "$REPO_NAME" | cut -d'/' -f1)
    REPO=$(echo "$REPO_NAME" | cut -d'/' -f2)
else
    echo "⚠️  Could not detect git repository. Using defaults."
    OWNER="YOUR-USERNAME"
    REPO="YOUR-REPO-NAME"
fi

echo "Detected configuration:"
echo "  Owner: $OWNER"
echo "  Repository: $REPO"
echo

# Prompt for confirmation or custom values
read -p "Is this correct? (y/n) [y]: " CONFIRM
CONFIRM=${CONFIRM:-y}

if [ "$CONFIRM" != "y" ]; then
    read -p "Enter GitHub username/organization: " OWNER
    read -p "Enter repository name: " REPO
fi

read -p "Enter presentation title [$REPO]: " TITLE
TITLE=${TITLE:-"$REPO"}

# Replace placeholders in files
echo
echo "📝 Updating files..."

# Function to replace text in files (cross-platform)
replace_in_file() {
    local file=$1
    local pattern=$2
    local replacement=$3
    sed "s|$pattern|$replacement|g" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
}

# Update README.md
replace_in_file README.md "YOUR-USERNAME" "$OWNER"
replace_in_file README.md "YOUR-REPO-NAME" "$REPO"
replace_in_file README.md "Presentation Title" "$TITLE"

# Update index.html
replace_in_file index.html "Presentation Title" "$TITLE"
replace_in_file index.html "slides/presentation.md" "slides/$REPO.md"

# Update package.json
replace_in_file package.json "\"name\": \"presentation-template\"" "\"name\": \"$REPO\""

# Rename the markdown file
if [ -f "slides/presentation.md" ]; then
    mv "slides/presentation.md" "slides/$REPO.md"
    echo "✅ Renamed slides/presentation.md to slides/$REPO.md"
elif [ -f "slides/ddev-linux-10-minutes.md" ]; then
    mv "slides/ddev-linux-10-minutes.md" "slides/$REPO.md"
    echo "✅ Renamed slides/ddev-linux-10-minutes.md to slides/$REPO.md"
fi

# Self-destruct: remove this setup script
echo
echo "🎉 Setup complete!"
echo
echo "Next steps:"
echo "  1. Edit slides/$REPO.md with your presentation content"
echo "  2. Customize css/custom.css if needed"
echo "  3. Add images to the images/ directory"
echo "  4. Commit and push your changes"
echo "  5. Enable GitHub Pages in repository settings (Settings > Pages > Deploy from main branch)"
echo
read -p "Remove this setup script? (y/n) [y]: " REMOVE
REMOVE=${REMOVE:-y}

if [ "$REMOVE" = "y" ]; then
    rm -- "$0"
    echo "✅ Setup script removed"
fi
