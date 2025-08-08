#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(pwd)"
CODE_DIR="$ROOT_DIR/code"
mkdir -p "$CODE_DIR"

clone_or_update() {
    local name="$1" url="$2" ref="${3:-}"      # optional 3rd arg: branch/tag/commit
    local dest="$CODE_DIR/$name"

    if [[ ! -d "$dest/.git" ]]; then
        echo "Cloning $name -> $dest"
        git clone "$url" "$dest"
    else
        echo "Updating $name in $dest"
        git -C "$dest" fetch --all --prune
    fi

    if [[ -n "$ref" ]]; then
        git -C "$dest" checkout -q "$ref"
    fi
}

clone_or_update "BachelorThesis_TenantFE"  "https://github.com/MysterionAutotronic/BachelorThesis_TenantFE.git"
clone_or_update "BachelorThesis_TenantBE"  "https://github.com/MysterionAutotronic/BachelorThesis_TenantBE.git"
clone_or_update "BachelorThesis_DashboardFE" "https://github.com/MysterionAutotronic/BachelorThesis_DashboardFE.git"
clone_or_update "BachelorThesis_DashboardBE" "https://github.com/MysterionAutotronic/BachelorThesis_DashboardBE.git"
clone_or_update "BachelorThesis_ConfigSchema" "https://github.com/MysterionAutotronic/BachelorThesis_ConfigSchema.git"
clone_or_update "BachelorThesis_Infra"     "https://github.com/MysterionAutotronic/BachelorThesis_Infra.git"
