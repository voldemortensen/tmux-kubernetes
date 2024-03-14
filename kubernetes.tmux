#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

kubnernetes_interpolations=(
    "\#{kubernetes_context}"
    "\#{kubernetes_namespace}"
    "\#{kubernetes_cluster}"
)

kubernetes_commands=(
    "#(CURRENT_DIR/context.sh)"
    "#(CURRENT_DIR/namespace.sh)"
    "#(CURRENT_DIR/cluster.sh)"
)

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local all_interpolated="$1"
	for ((i=0; i<${#kubernetes_commands[@]}; i++)); do
		all_interpolated=${all_interpolated//${kubernetes_interpolation[$i]}/${kubernetes_commands[$i]}}
	done
	echo "$all_interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
