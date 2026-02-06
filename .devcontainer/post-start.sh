#!/bin/bash
set -e

echo "🦞 Moltbot (OpenClaw) Codespaces Ready"
echo "======================================"

# 檢查 moltbot 目錄
if [ -d "moltbot" ]; then
  cd moltbot
    echo "✓ Moltbot directory found"

        # 確保依賴是最新的
          echo "📦 Ensuring dependencies are up to date..."
            pnpm install --frozen-lockfile

                echo ""
                  echo "✅ Codespace is ready!"
                    echo ""
                      echo "Available commands:"
                        echo "  pnpm gateway:watch    - Run development gateway with auto-reload"
                          echo "  pnpm openclaw onboard - Interactive setup wizard"
                            echo "  pnpm openclaw agent   - Send a message to the AI assistant"
                              echo ""
                                echo "Quick start:"
                                  echo "  1. Run: pnpm gateway:watch"
                                    echo "  2. Open: http://localhost:18789"
                                      echo ""
                                      else
                                        echo "⚠️  Moltbot directory not found. Please run post-create.sh first."
                                        fi
                                        
