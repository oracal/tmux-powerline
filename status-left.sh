#!/usr/bin/env bash
#Print the status-left for tmux.
#
# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Mute this statusbar?
mute_status_check "left"

# Segments

declare -A tmux_session_info
tmux_session_info+=(["script"]="${segments_path}/tmux_session_info.sh")
tmux_session_info+=(["foreground"]="colour231")
tmux_session_info+=(["background"]="colour61")
tmux_session_info+=(["separator"]="${separator_right_bold}")
tmux_session_info+=(["separator_fg"]="default")
register_segment "tmux_session_info"

declare -A lan_ip
lan_ip+=(["script"]="${segments_path}/lan_ip.sh")
lan_ip+=(["foreground"]="colour231")
lan_ip+=(["background"]="colour33")
lan_ip+=(["separator"]="${separator_right_bold}")
register_segment "lan_ip"

# declare -A hostname
# hostname+=(["script"]="${segments_path}/hostname.sh")
# hostname+=(["foreground"]="colour231")
# hostname+=(["background"]="colour33")
# hostname+=(["separator"]="${separator_left_bold}")
# register_segment "hostname"

declare -A pwd
pwd+=(["script"]="${segments_path}/pwd.sh")
pwd+=(["foreground"]="colour231")
pwd+=(["background"]="colour24")
pwd+=(["separator"]="${separator_right_bold}")
register_segment "pwd"

# Print the status line in the order of registration above.
print_status_line_left

exit 0
