# CLAUDE.md

このファイルは、このリポジトリでClaude Code (claude.ai/code)が作業する際のガイダンスを提供します。

## プロジェクト概要

Base SepoliaテストネットでNFTをデプロイするためのブロックチェーン学習プロジェクトです。開発フレームワークとしてHardhat、セキュアなNFT実装のためにOpenZeppelinコントラクトを使用しています。

## 必須コマンド

### 開発コマンド
```bash
# 依存関係のインストール
npm install

# スマートコントラクトのコンパイル
npx hardhat compile

# Base SepoliaへNFTコントラクトをデプロイ
npx hardhat run scripts/deploy.js --network base-sepolia

# NFTのミント（.envにCONTRACT_ADDRESSが必要）
npx hardhat run scripts/mint.js --network base-sepolia

# トークン認証でGitHubへプッシュ
./scripts/git-push.sh
```

### テスト
現在テストは未実装。テスト追加時：
```bash
npx hardhat test
npx hardhat test test/specific-test.js  # 単一テストファイルの実行
```

## アーキテクチャ

### スマートコントラクト構造
- **MyNFT.sol**: OpenZeppelinを使用したERC721実装
  - 継承: ERC721, ERC721URIStorage, Ownable
  - 主要関数: `safeMint(address to, string memory uri)` - オーナー限定のミント機能
  - 0から始まる自動インクリメントのトークンID

### ネットワーク設定
- **ターゲットネットワーク**: Base Sepolia (Chain ID: 84532)
- **RPC**: https://sepolia.base.org
- **Solidityバージョン**: 0.8.20

### スクリプトの動作
- **deploy.js**: MyNFTコントラクトをデプロイし、コントラクトアドレスを出力
- **mint.js**: .envからCONTRACT_ADDRESSを読み込み、指定されたTOKEN_URIでNFTをミント
- **git-push.sh**: .envのGITHUB_TOKENを使用して認証

## 環境設定

必要な.env変数:
```
PRIVATE_KEY=              # MetaMask秘密鍵（0xプレフィックスなし）
CONTRACT_ADDRESS=         # デプロイ後に設定
GITHUB_TOKEN=            # git-push.shスクリプト用
RECIPIENT_ADDRESS=       # オプション、デフォルトはデプロイヤー
TOKEN_URI=              # オプション、デフォルトは例のURI
```

## 開発ワークフロー

1. クローン後、`npm install`を実行
2. `.env.example`を`.env`にコピーし、PRIVATE_KEYを設定
3. faucetからBase SepoliaテストETHを取得
4. コントラクトをデプロイし、アドレスを.envに保存
5. mintスクリプトを使用してNFTをミント

## 重要事項

- 日本語ドキュメントを含む学習用プロジェクト
- テストスイートは未実装
- すべての機密データに環境変数を使用
- GitプッシュにはGitHub Personal Access Token（'repo'スコープ）が必要
- **Gitプッシュ時の注意**: 必ず`./scripts/git-push.sh`を使用するか、`source .env`を実行してから`git push`を行うこと（トークン認証のため）