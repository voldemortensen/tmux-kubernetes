#!/usr/bin/env bash

get_option() {
  local option=$(tmux show-option -gqv "$1")
  [ -z $option ] && echo $2 || echo $option
}

kubernetes_context() {
    kubernetes_context_bg=$(get_option "@kubernetes-context-bg" "colour0")
    kubernetes_context_fg=$(get_option "@kubernetes-context-fg" "colour7")
    kubernetes_context=$(kubectl config current-context)
    echo "#[fg=$kubernetes_context_fg,bg=$kubernetes_context_bg]$kubernetes_context"
}

kubernetes_namespace() {
    kubernetes_namespace_bg=$(get_option "@kubernetes-namespace-bg" "colour0")
    kubernetes_namespace_fg=$(get_option "@kubernetes-namespace-fg" "colour7")
    kubernetes_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    echo -n "#[fg=$kubernetes_namespace_fg,bg=$kubernetes_namespace_bg]$kubernetes_namespace"
}

kubernetes_cluster() {
    kubernetes_cluster_bg=$(get_option "@kubernetes-cluster-bg" "colour0")
    kubernetes_cluster_fg=$(get_option "@kubernetes-cluster-fg" "colour7")
    kubernetes_cluster=$(kubectl config view --minify --output 'jsonpath={..clusters[].name}')
    echo -n "#[fg=$kubernetes_cluster_fg,bg=$kubernetes_cluster_bg]$kubernetes_cluster"
}
