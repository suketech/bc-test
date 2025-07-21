#!/bin/bash
# Daily automatic git push script

# PATHを明示的に設定（必要なコマンドを含むパスを追加）
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin


# スクリプトのディレクトリを取得
#SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
# プロジェクトディレクトリに移動
#cd "$PROJECT_DIR"

# マニュアルでフォルダ移動
cd /home/sk-gamma/projects/bc-test/scripts/

# 現在の日付を取得
DATE=$(date +"%Y-%m-%d %H:%M:%S")
/bin/echo $DATE >> update-time.log

# Gitステータスを確認
if [ -z "$(git status --porcelain)" ]; then
    /bin/echo "No changes to commit"
    exit 0
fi

# 全ての変更をステージ
git add .

# コミット
git commit -m "Daily automatic update: $DATE"

# git-push.shを使用してプッシュ
#"$SCRIPT_DIR/git-push.sh"
/home/sk-gamma/projects/bc-test/scripts/git-push.sh
