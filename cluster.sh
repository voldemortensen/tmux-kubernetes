#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

main() {
    kubernetes_cluster_bg=$(get_tmux_option "@kubernetes-cluster-bg" "colour0")
    kubernetes_cluster_fg=$(get_tmux_option "@kubernetes-cluster-fg" "colour7")
    kubernetes_cluster=$(kubectl config view --minify --output 'jsonpath={..clusters[].name}')
    echo "#[fg=$kubernetes_cluster_fg,bg=$kubernetes_cluster_bg]$kubernetes_cluster"
}

main
