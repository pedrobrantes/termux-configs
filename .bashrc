ubuntu() {
    local distro="ubuntu"
    local sd_id=$(command ls -1 /storage 2>/dev/null | grep -E '^[0-9A-F]{4}-[0-9A-F]{4}$' | head -n 1)

    [ -z "$sd_id" ] && sd_id=$(df -h 2>/dev/null | grep -oE '[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}' | head -n 1)

    local sd_path="/storage/$sd_id"

    echo "Using SD Card path: $sd_path"

    proot-distro login "$distro" \
        --user brantes \
        --bind "$HOME:/mnt/termux_home" \
        --bind "/data/data/com.termux/files:/mnt/termux_root" \
        --bind "$sd_path:/mnt/sdcard"
}
