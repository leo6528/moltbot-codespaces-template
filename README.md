# 安全性注意事項

⚠️ **重要**: 

1. **不要在 Codespace 中存儲敏感信息**
2.    - API 密鑰應存儲在 GitHub Secrets 中
      -    - 使用環境變數而不是硬編碼
           -
           - 2. **Codespace 是臨時的**
             3.    - 關閉後 30 天會被刪除
                   -    - 重要數據應備份到外部存儲
                        -
                        - 3. **埠轉發是公開的**
                          4.    - 任何知道 URL 的人都可以訪問
                                -    - 使用認證令牌或密碼保護
                                     -
                                     - ## 文件結構
                                     -
                                     - ```
                                       .
                                       ├── .devcontainer/
                                       │   ├── devcontainer.json      # Codespaces 配置
                                       │   ├── post-create.sh         # 容器建立後執行
                                       │   └── post-start.sh          # 容器啟動後執行
                                       ├── .github/
                                       │   └── workflows/
                                       │       └── test-codespaces.yml # CI/CD 工作流程
                                       ├── .env.example               # 環境變數範本
                                       ├── quick-start.sh             # 快速啟動腳本
                                       └── README.md                  # 本檔案
                                       ```

                                       ## 進階用法

                                       ### 自訂 Codespaces 配置

                                       編輯 `.devcontainer/devcontainer.json` 以自訂：
                                       - 基礎鏡像
                                       - - VS Code 擴展
                                         - - 環境變數
                                           - - 埠轉發
                                             -
                                             - ### 新增自訂腳本
                                             -
                                             - 在 `.devcontainer/` 中建立新腳本，並在 `devcontainer.json` 中引用：
                                             -
                                             - ```json
                                               "postCreateCommand": "bash .devcontainer/my-custom-setup.sh"
                                               ```

                                               ### 使用 Docker Compose

                                               對於更複雜的設定，可以使用 `docker-compose.yml`：

                                               ```json
                                               {
                                                 "dockerComposeFile": "docker-compose.yml",
                                                 "service": "moltbot",
                                                 "workspaceFolder": "/workspace"
                                               }
                                               ```

                                               ## 資源

                                               - 🌐 **官方網站**: https://openclaw.dev
                                               - - 📚 **文件**: https://github.com/openclaw/openclaw/tree/main/docs
                                                 - - 💬 **Discord 社群**: [加入社群]
                                                   - - 🐛 **報告問題**: https://github.com/openclaw/openclaw/issues
                                                     -
                                                     - ## 授權
                                                     -
                                                     - 此範本基於 [OpenClaw](https://github.com/openclaw/openclaw)，採用 MIT 授權。
                                                     -
                                                     - ## 貢獻
                                                     -
                                                     - 歡迎提交 Pull Request 改進此範本！
                                                     -
                                                     - ---
                                                     -
                                                     - **祝您使用愉快！🦞**
                                                     - # 🦞 Moltbot (OpenClaw) - GitHub Codespaces Template

在 GitHub Codespaces 上快速部署和運行 **Moltbot (OpenClaw)** 個人 AI 助理，無需複雜的本地設定。

## 什麼是 Moltbot？

**Moltbot**（現已更名為 **OpenClaw**）是一個開源的個人 AI 助理，可以在您已使用的通訊頻道上運行：

- 📱 **通訊平台**: WhatsApp、Telegram、Slack、Discord、Google Chat、Signal、iMessage、Microsoft Teams、Matrix 等
- 🎤 **語音支援**: macOS/iOS/Android 上的語音輸入和輸出
- 🧠 **AI 模型**: 支援 Claude、GPT-4、Gemini 等
- 🛠️ **技能系統**: 可擴展的技能和工具整合

## 快速開始

### 方式 1: 一鍵啟動（推薦）

1. **建立 Codespace**
   - 點擊此倉庫的 `Code` 按鈕
   - 選擇 `Codespaces` 標籤
   - 點擊 `Create codespace on main`

2. **等待環境準備**
   - Codespace 會自動執行 `.devcontainer/post-create.sh`
   - 安裝 Node.js、pnpm、Bun 和所有依賴
   - 構建 Moltbot

3. **啟動 Gateway**
   ```bash
   cd moltbot
   pnpm gateway:watch
   ```

4. **存取 Web 介面**
   - 終端會顯示埠轉發 URL
   - 點擊 `http://localhost:18789` 或類似的 URL

### 方式 2: 使用快速啟動腳本

```bash
bash quick-start.sh
```

這個腳本會：
- 克隆 Moltbot 倉庫
- 安裝所有依賴
- 構建專案
- 啟動 Gateway

### 方式 3: 手動設定

```bash
# 進入 Codespace 終端

# 克隆倉庫
git clone https://github.com/openclaw/openclaw.git moltbot
cd moltbot

# 安裝依賴
pnpm install --frozen-lockfile

# 構建
OPENCLAW_A2UI_SKIP_MISSING=1 pnpm build
export OPENCLAW_PREFER_PNPM=1
pnpm ui:build

# 啟動 Gateway
pnpm gateway:watch
```

## 配置

### 環境變數

複製 `.env.example` 到 `.env` 並填入您的設定：

```bash
cp .env.example .env
```

#### 必需的配置（如果要使用 AI 功能）

**Anthropic (Claude) - 推薦**
```
ANTHROPIC_API_KEY=sk-ant-...
```

**OpenAI**
```
OPENAI_API_KEY=sk-...
```

#### 通訊頻道配置

**Discord**
```
DISCORD_BOT_TOKEN=your_token_here
```

**Telegram**
```
TELEGRAM_BOT_TOKEN=your_token_here
```

### 互動式設定

執行 Moltbot 的設定精靈：

```bash
cd moltbot
pnpm openclaw onboard
```

這會引導您：
1. 選擇 AI 模型提供商
2. 設定通訊頻道
3. 配置技能和工具

## 常用命令

在 `moltbot` 目錄中執行：

| 命令 | 說明 |
|------|------|
| `pnpm gateway:watch` | 啟動 Gateway（開發模式，自動重載） |
| `pnpm openclaw onboard` | 互動式設定精靈 |
| `pnpm openclaw agent --message "Hello"` | 向 AI 發送訊息 |
| `pnpm openclaw message send --to +1234567890 --message "Hi"` | 發送訊息到指定號碼 |
| `pnpm build` | 構建專案 |
| `pnpm test` | 執行測試 |

## 埠轉發

Codespaces 會自動轉發以下埠：

| 埠 | 服務 | 說明 |
|----|------|------|
| 18789 | Moltbot Gateway | 主要 API 和 Web 介面 |
| 3000 | Web UI | 備用 Web 介面 |
| 8080 | 替代埠 | 備用埠 |

## 故障排除

### 問題: 「pnpm: command not found」

**解決方案**: 在 Codespace 終端中執行：
```bash
npm install -g pnpm
```

### 問題: 「Node.js version is too old」

**解決方案**: Codespace 應該已經安裝了 Node.js 22，但如果沒有：
```bash
nvm install 22
nvm use 22
```

### 問題: 構建失敗

**解決方案**: 清除快取並重新安裝：
```bash
rm -rf node_modules pnpm-lock.yaml
pnpm install --frozen-lockfile
pnpm build
```

### 問題: 無法連接到 Gateway

**解決方案**: 
1. 確認 Gateway 正在運行：`pnpm gateway:watch`
2. 檢查埠轉發：在 Codespace 的「埠」標籤中查看
3. 查看日誌：檢查終端輸出中的錯誤訊息

## 在 Codespaces 中持續運行

Codespaces 在不活動 30 分鐘後會暫停。要保持 Moltbot 運行：

### 選項 1: 定期保活

在另一個終端標籤中執行：
```bash
while true; do
  curl -s http://localhost:18789/health || true
  sleep 5m
done
```

### 選項 2: 使用 GitHub Actions

建立工作流程定期 ping 您的 Codespace。

### 選項 3: 部署到雲端

對於生產環境，建議部署到：
- **Fly.io** - 使用 `fly.toml`
- **Azure Container Apps** - 使用 `azd up`
- **Cloudflare Workers** - 使用 moltworker

## 成本

### GitHub Codespaces 免費額度

- **個人帳戶**: 每月 60 小時（4 核心機器）
- **組織**: 根據訂閱計畫

### 超出額度後

- 按小時計費（約 $0.18/小時，4 核心機器）
- 可升級到 Pro 或 Team 計畫以獲得更多額度

## 安全性注意事項

⚠️ **重要**: 

1. **不要在 Codespace 中存儲敏感信息**
   - API 密鑰應存儲在 GitHub Secrets 中
   - 使用環境變數而不是硬編碼

2. **Codespace 是臨時的**
   - 關閉後 30 天會被刪除
   - 重要數據應備份到外部存儲

3. **埠轉發是公開的**
   - 任何知道 URL 的人都可以訪問
   - 使用認證令牌或密碼保護

## 文件結構

```
.
├── .devcontainer/
│   ├── devcontainer.json      # Codespaces 配置
│   ├── post-create.sh         # 容器建立後執行
│   └── post-start.sh          # 容器啟動後執行
├── .github/
│   └── workflows/
│       └── test-codespaces.yml # CI/CD 工作流程
├── .env.example               # 環境變數範本
├── quick-start.sh             # 快速啟動腳本
└── README.md                  # 本檔案
```

## 進階用法

### 自訂 Codespaces 配置

編輯 `.devcontainer/devcontainer.json` 以自訂：
- 基礎鏡像
- VS Code 擴展
- 環境變數
- 埠轉發

### 新增自訂腳本

在 `.devcontainer/` 中建立新腳本，並在 `devcontainer.json` 中引用：

```json
"postCreateCommand": "bash .devcontainer/my-custom-setup.sh"
```

### 使用 Docker Compose

對於更複雜的設定，可以使用 `docker-compose.yml`：

```json
{
  "dockerComposeFile": "docker-compose.yml",
  "service": "moltbot",
  "workspaceFolder": "/workspace"
}
```

## 資源

- 🌐 **官方網站**: https://openclaw.dev
- 📚 **文件**: https://github.com/openclaw/openclaw/tree/main/docs
- 💬 **Discord 社群**: [加入社群]
- 🐛 **報告問題**: https://github.com/openclaw/openclaw/issues

## 授權

此範本基於 [OpenClaw](https://github.com/openclaw/openclaw)，採用 MIT 授權。

## 貢獻

歡迎提交 Pull Request 改進此範本！

---

**祝您使用愉快！🦞**
