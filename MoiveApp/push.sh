#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Ankit-Dhattarwal/MovieIOS.git"
DEFAULT_BRANCH="main"

# Ensure we're at project root (script location)
cd "$(dirname "$0")"

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is not installed or not on PATH." >&2
  exit 1
fi

# Initialize repository if needed
if [ ! -d .git ]; then
  echo "Initializing git repository..."
  git init
fi

# Set default branch to main locally (Git >= 2.28 supports -M)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")
if [ "$CURRENT_BRANCH" != "$DEFAULT_BRANCH" ]; then
  git branch -M "$DEFAULT_BRANCH" || true
fi

# Add all files and commit if there are changes
if [ -n "$(git status --porcelain)" ]; then
  echo "Staging and committing changes..."
  git add .
  if git rev-parse --verify HEAD >/dev/null 2>&1; then
    git commit -m "Update project"
  else
    git commit -m "Initial commit: Movie iOS app"
  fi
else
  echo "No changes to commit."
fi

# Configure remote
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi

# Push
echo "Pushing to $REPO_URL ($DEFAULT_BRANCH)..."
git push -u origin "$DEFAULT_BRANCH"

echo "Done. Your project should now be on GitHub."
