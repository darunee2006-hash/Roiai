#!/usr/bin/env bash
# efin AI ROI — One-click Vercel deploy for Mac/Linux
set -e
cd "$(dirname "$0")"

echo "===================================================="
echo " efin AI Productivity & ROI - Deploy to Vercel"
echo "===================================================="

if ! command -v node &>/dev/null; then
  echo "[ERROR] Node.js not found. Please install Node.js first."
  echo "Download: https://nodejs.org/"
  exit 1
fi

echo "[1/2] Deploying to Vercel production..."
echo
echo "If this is the first time, you will be asked to:"
echo "  1. Login (browser will open)"
echo "  2. Confirm project settings (Enter for defaults)"
echo

npx vercel --prod

echo
echo "===================================================="
echo " Deploy finished. Your site URL is shown above."
echo "===================================================="
