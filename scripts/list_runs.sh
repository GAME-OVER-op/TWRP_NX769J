#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 3 ]; then
  echo "Usage: $0 <owner> <repo> <token>"
  exit 1
fi

OWNER="$1"
REPO="$2"
TOKEN="$3"

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${OWNER}/${REPO}/actions/runs?per_page=10" | jq '.workflow_runs[] | {id, status, conclusion, html_url, created_at, name, head_branch}'
