#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

main() {
    kubernetes_namespace_bg=$(get_tmux_option "@kubernetes-namespace-bg" "colour0")
    kubernetes_namespace_fg=$(get_tmux_option "@kubernetes-namespace-fg" "colour7")
    kubernetes_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    echo "#[fg=$kubernetes_namespace_fg,bg=$kubernetes_namespace_bg]$kubernetes_namespace"
}

main
