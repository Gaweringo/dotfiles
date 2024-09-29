# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# current date formatted as 'Sun 2024-19-29 09:59:08 PM'
date_formatted=$(date +'%a %Y-%m-%d %X';)

# Get the Linux version but remove the "-1-ARCH" part
linux_version=$(uname -r | cut -d '-' -f1)

# current keyboard layout
current_layout=$(swaymsg -t get_inputs | jq 'map(select(has("xkb_active_layout_name")))[0].xkb_active_layout_name')

# current disk usage
disk_usage=$(df -h / | awk 'NR==2 {print $5}')

# current cpu usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f", $2 + $4}')

# current ram usage
ram_usage=$(top -bn1 | grep "B Mem" | awk '{printf "%.1f", $8/$4 * 100.0}')

sep=" | "

# Returns the battery status: "Full", "Discharging", or "Charging".
# battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Emojis and characters for the status bar
echo   '  ' $current_layout "$sep"   '  ' $ram_usage% "$sep"   ' ' $cpu_usage% "$sep"   ' ' $disk_usage "$sep" ↑ $uptime_formatted "$sep"  ' ' $linux_version "$sep" $date_formatted
