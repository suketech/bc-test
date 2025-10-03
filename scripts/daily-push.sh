#!/bin/bash
set -euo pipefail
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/../.env"

: "${BC_TEST_REPO_ROOT:?BC_TEST_REPO_ROOT not set}"

cd "$BC_TEST_REPO_ROOT/scripts/"

DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo "$DATE - start" >> update-time.log

if [ -z "$(git status --porcelain)" ]; then
  echo "$DATE - No changes to commit" >> update-time.log
  exit 0
fi

git add -A
git commit -m "Daily automatic update: $DATE"

"$SCRIPT_DIR/git-push.sh"

echo "$DATE - done" >> update-time.log

