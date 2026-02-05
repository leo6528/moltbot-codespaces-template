#!/bin/bash
set -e

echo "🦞 Moltbot (OpenClaw) Quick Start"
echo "=================================="
echo ""

# 檢查 Node.js
if ! command -v node &> /dev/null; then
  echo "❌ Node.js is not installed. Please install Node.js 22 or later."
  exit 1
fi

echo "✓ Node.js $(node --version)"

# 檢查或克隆倉庫
if [ ! -d "moltbot" ]; then
  echo ""
  echo "📥 Cloning Moltbot repository..."
  git clone https://github.com/openclaw/openclaw.git moltbot
fi

cd moltbot

# 安裝 pnpm
if ! command -v pnpm &> /dev/null; then
  echo ""
  echo "📦 Installing pnpm..."
  npm install -g pnpm
fi

echo "✓ pnpm $(pnpm --version)"

# 安裝依賴
echo ""
echo "📦 Installing dependencies..."
pnpm install --frozen-lockfile

# 構建
echo ""
echo "🔨 Building Moltbot..."
OPENCLAW_A2UI_SKIP_MISSING=1 pnpm build
export OPENCLAW_PREFER_PNPM=1
pnpm ui:build

echo ""
echo "✅ Setup complete!"
echo ""
echo "🚀 Starting Moltbot Gateway..."
echo ""
echo "Available commands:"
echo "  pnpm gateway:watch    - Run with auto-reload"
echo "  pnpm openclaw onboard - Interactive setup"
echo "  pnpm openclaw agent   - Send message to AI"
echo ""
echo "Press Ctrl+C to stop"
echo ""

# 啟動 gateway
pnpm gateway:watch
