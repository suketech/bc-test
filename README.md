# Base Sepolia NFT プロジェクト

Base SepoliaテストネットでNFTを発行するための学習用プロジェクトです。

## 必要な準備

1. **Node.js** (v18以上推奨)
2. **MetaMaskウォレット** 
3. **Base Sepolia ETH** (テストネット用のETH)

## セットアップ手順

### 1. 依存関係のインストール

```bash
npm install
```

### 2. 環境変数の設定

`.env.example`をコピーして`.env`ファイルを作成します：

```bash
cp .env.example .env
```

`.env`ファイルを編集して以下を設定：

- `PRIVATE_KEY`: MetaMaskからエクスポートした秘密鍵（0xプレフィックスなし）
- `CONTRACT_ADDRESS`: デプロイ後に取得したコントラクトアドレス
- `RECIPIENT_ADDRESS`: NFTを受け取るアドレス（省略可）
- `TOKEN_URI`: NFTのメタデータURI

### 3. Base Sepolia ETHの取得

Base Sepoliaのfaucetから無料のテストETHを取得：
- https://www.coinbase.com/faucets/base-ethereum-sepolia-faucet
- https://docs.base.org/docs/tools/network-faucets/

## 使い方

### 1. コントラクトのコンパイル

```bash
npx hardhat compile
```

### 2. コントラクトのデプロイ

```bash
npx hardhat run scripts/deploy.js --network base-sepolia
```

デプロイが成功すると、コントラクトアドレスが表示されます。
このアドレスを`.env`の`CONTRACT_ADDRESS`に設定してください。

### 3. NFTのミント

```bash
npx hardhat run scripts/mint.js --network base-sepolia
```

## コントラクトの確認

デプロイしたコントラクトは以下で確認できます：
- Base Sepolia Explorer: https://sepolia.basescan.org/

## プロジェクト構造

```
bc-test/
├── contracts/
│   └── MyNFT.sol        # NFTスマートコントラクト
├── scripts/
│   ├── deploy.js        # デプロイスクリプト
│   └── mint.js          # ミントスクリプト
├── hardhat.config.js    # Hardhat設定
├── package.json         # プロジェクト依存関係
├── .env.example         # 環境変数テンプレート
└── README.md            # このファイル
```

## トラブルシューティング

1. **ガス不足エラー**: Base Sepolia ETHが十分にあるか確認
2. **ネットワークエラー**: MetaMaskがBase Sepoliaに接続されているか確認
3. **秘密鍵エラー**: `.env`の`PRIVATE_KEY`が正しく設定されているか確認

## 参考リンク

- [Base Documentation](https://docs.base.org/)
- [Hardhat Documentation](https://hardhat.org/docs)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)