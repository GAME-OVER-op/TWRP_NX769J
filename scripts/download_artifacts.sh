#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 4 ]; then
  echo "Usage: $0 <owner> <repo> <token> <run_id>"
  exit 1
fi

OWNER="$1"
REPO="$2"
TOKEN="$3"
RUN_ID="$4"

ARTIFACT_URL=$(curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${OWNER}/${REPO}/actions/runs/${RUN_ID}/artifacts" | jq -r '.artifacts[0].archive_download_url')

if [ -z "$ARTIFACT_URL" ] || [ "$ARTIFACT_URL" = "null" ]; then
  echo "No artifacts found for run ${RUN_ID}"
  exit 1
fi

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$ARTIFACT_URL" -o "artifact-${RUN_ID}.zip"

echo "Saved artifact-${RUN_ID}.zip"
