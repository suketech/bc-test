#!/bin/bash
# Daily automatic git push script

# スクリプトのディレクトリを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# プロジェクトディレクトリに移動
cd "$PROJECT_DIR"

# 現在の日付を取得
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo $DATE >> update-time.log

# Gitステータスを確認
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit"
    exit 0
fi

# 全ての変更をステージ
git add .

# コミット
git commit -m "Daily automatic update: $DATE"

# git-push.shを使用してプッシュ
"$SCRIPT_DIR/git-push.sh"
