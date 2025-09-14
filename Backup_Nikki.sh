#!/bin/sh

# Script interaktif untuk install/uninstall nikki.lua & backup.htm di LuCI

CONTROLLER="/usr/lib/lua/luci/controller/nikki.lua"
VIEW="/usr/lib/lua/luci/view/backup.htm"

install_files() {
    echo "🚀 Mulai install nikki.lua & backup.htm ke LuCI ..."

    # Download controller
    wget -O "$CONTROLLER" https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/nikki.lua

    # Download view
    wget -O "$VIEW" https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/backup.htm

    # Set permission
    chmod 644 "$CONTROLLER" "$VIEW"

    # Restart LuCI webserver
    /etc/init.d/uhttpd restart

    echo "✅ Install selesai! Silakan buka LuCI untuk cek menu baru."
}

uninstall_files() {
    echo "🗑️  Mulai uninstall nikki.lua & backup.htm dari LuCI ..."

    # Hapus file
    rm -f "$CONTROLLER" "$VIEW"

    # Restart LuCI webserver
    /etc/init.d/uhttpd restart

    echo "✅ Uninstall selesai! File sudah dihapus."
}

echo "=============================="
echo "  Manage Nikki LuCI Script"
echo "=============================="
echo "1) Install"
echo "2) Uninstall"
echo "=============================="
printf "Pilih opsi [1-2]: "
read choice

case "$choice" in
    1)
        install_files
        ;;
    2)
        uninstall_files
        ;;
    *)
        echo "❌ Pilihan tidak valid!"
        exit 1
        ;;
esac
