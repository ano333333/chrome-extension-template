# Chrome拡張機能テンプレート

Svelte + TypeScript + Viteを使用したChrome拡張機能の開発テンプレートです。

## 概要

このテンプレートは、Chrome拡張機能を効率的に開発するための基盤を提供します。モダンなフロントエンド技術スタックを使用し、開発体験を向上させます。

## 技術スタック

- **Svelte**: 軽量で高性能なフロントエンドフレームワーク
- **TypeScript**: 型安全性を提供するJavaScriptのスーパーセット
- **Vite**: 高速なビルドツールと開発サーバー
- **pnpm**: 効率的なパッケージマネージャー

## 推奨IDE設定

### VSCode

`.vscode/extensions.json`の推奨拡張機能を確認してください。

## プロジェクト構造

```
chrome-extension-template/
├── src/                    # ソースコード
│   ├── assets/            # 静的アセット
│   ├── lib/               # 再利用可能なコンポーネント
│   │   └── Counter.svelte # カウンターコンポーネント
│   ├── public/            # 公開ファイル
│   ├── popup.html         # ポップアップHTML
│   ├── Popup.svelte       # ポップアップコンポーネント
│   ├── popup.ts           # ポップアップエントリーポイント
│   └── index.css          # グローバルスタイル
├── node_modules/          # 依存関係
├── .vscode/               # VS Code設定
│   ├── extensions.json    # 推奨拡張機能
│   └── settings.json      # ワークスペース設定
├── biome.json             # Biome設定（リンター・フォーマッター）
├── flake.lock             # Nix依存関係ロックファイル
├── flake.nix              # Nix設定ファイル
├── package.json           # Node.jsプロジェクト設定
├── pnpm-lock.yaml         # pnpm依存関係ロックファイル
├── README.md              # プロジェクト説明書
├── svelte.config.js       # Svelte設定
├── tsconfig.app.json      # TypeScriptアプリ設定
├── tsconfig.json          # TypeScript設定
├── tsconfig.node.json     # TypeScript Node設定
└── vite.config.ts         # Vite設定
```

## 開発環境のセットアップ

### Nixを使用した開発環境（推奨）

このプロジェクトはNixを使用して再現可能な開発環境を提供しています。

#### 前提条件

- Nixがインストールされていること
- Nix Flakesが有効になっていること

#### direnvによるdevShellの自動起動

- nix-direnvを有効化し、
- .envrcを作成している(内容は.envrc.exampleをコピーすること)

場合、ターミナル上でこのリポジトリに移動(cd)すると自動的にdevShellに入ります。

```bash
cd chrome-extension-template

# この段階でNix devShellに入る
# devShell内で依存関係をインストール
pnpm install

# 本番ビルド
pnpm build
```

#### 手動でのdevShellの起動

```bash
# Nix devShellに入る
nix develop

# devShell内で依存関係をインストール
pnpm install

# 本番ビルド
pnpm build
```

#### devShellの内容

- **Node.js 24**: 最新のLTSバージョン
- **pnpm**: 高速なパッケージマネージャー
- **自動PATH設定**: `node_modules/.bin`が自動的にPATHに追加

### 従来の方法

Nixを使用しない場合は、以下の手順でセットアップしてください。

#### 前提条件

- Node.js (推奨バージョン: 18以上)
- pnpm

#### インストール

```bash
# 依存関係のインストール
pnpm install

# 開発サーバーの起動
pnpm dev

# 本番ビルド
pnpm build
```

## Chrome拡張機能としての使用

1. `pnpm build`を実行してビルドを生成
2. Chromeの拡張機能管理ページ（chrome://extensions/）を開く
3. 「デベロッパーモード」を有効にする
4. 「パッケージ化されていない拡張機能を読み込む」をクリック
5. `dist`フォルダを選択
