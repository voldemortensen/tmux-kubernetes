#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

main() {
    kubernetes_context_bg=$(get_option "@kubernetes-context-bg" "colour0")
    kubernetes_context_fg=$(get_option "@kubernetes-context-fg" "colour7")
    kubernetes_context=$(kubectl config current-context)
    echo "#[fg=$kubernetes_context_fg,bg=$kubernetes_context_bg]$kubernetes_context"
}

main
