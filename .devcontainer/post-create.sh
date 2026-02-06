#!/bin/bash
set -e

echo "🦞 Moltbot (OpenClaw) Codespaces Setup"
echo "======================================"

# 檢查 Node.js 版本
echo "✓ Node.js version: $(node --version)"
echo "✓ npm version: $(npm --version)"

# 安裝 pnpm
echo ""
echo "📦 Installing pnpm..."
npm install -g pnpm@latest
echo "✓ pnpm version: $(pnpm --version)"

# 安裝 Bun（用於構建腳本）
echo ""
echo "📦 Installing Bun..."
curl -fsSL https://bun.sh/install | bash
export PATH="/root/.bun/bin:${PATH}"
echo "✓ Bun installed"

# 檢查是否存在 moltbot 倉庫
if [ ! -d "moltbot" ]; then
  echo ""
    echo "📥 Cloning Moltbot (OpenClaw) repository..."
      git clone https://github.com/openclaw/openclaw.git moltbot
        cd moltbot
        else
          echo ""
            echo "✓ Moltbot repository already exists"
              cd moltbot
              fi

              # 安裝依賴
              echo ""
              echo "📦 Installing Moltbot dependencies..."
              pnpm install --frozen-lockfile

              # 構建專案
              echo ""
              echo "🔨 Building Moltbot..."
              OPENCLAW_A2UI_SKIP_MISSING=1 pnpm build
              export OPENCLAW_PREFER_PNPM=1
              pnpm ui:build

              echo ""
              echo "✅ Setup complete!"
              echo ""
              echo "Next steps:"
              echo "1. Run: pnpm gateway:watch"
              echo "2. Access the gateway at: http://localhost:18789"
              echo "3. Or run: pnpm openclaw onboard"
              
