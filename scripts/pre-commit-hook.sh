#!/bin/sh
# Pre-commit hook to check if pnpm-lock.yaml is in sync with package.json
# To install this hook, run: cp scripts/pre-commit-hook.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit

# Check if package.json is being committed
if git diff --cached --name-only | grep -q "package.json"; then
  echo "📦 package.json modified, checking lockfile..."
  
  # Check if pnpm-lock.yaml is also staged
  if ! git diff --cached --name-only | grep -q "pnpm-lock.yaml"; then
    echo ""
    echo "❌ Error: package.json is modified but pnpm-lock.yaml is not staged"
    echo ""
    echo "Please run: pnpm install"
    echo "Then stage the lockfile: git add pnpm-lock.yaml"
    echo ""
    exit 1
  fi
  
  echo "✅ Lockfile is staged with package.json"
fi

exit 0
