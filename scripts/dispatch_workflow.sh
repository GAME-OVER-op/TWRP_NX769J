#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 3 ]; then
  echo "Usage: $0 <owner> <repo> <token> [ref]"
  exit 1
fi

OWNER="$1"
REPO="$2"
TOKEN="$3"
REF="${4:-main}"

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${OWNER}/${REPO}/actions/workflows/build-recovery.yml/dispatches" \
  -d @- <<JSON
{
  "ref": "${REF}",
  "inputs": {
    "manifest_url": "https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git",
    "manifest_branch": "twrp-12.1",
    "device_path": "device/nubia/NX769J",
    "lunch_target": "twrp_NX769J-eng",
    "build_target": "recoveryimage"
  }
}
JSON

echo
printf 'Workflow dispatched for %s/%s on ref %s\n' "$OWNER" "$REPO" "$REF"
