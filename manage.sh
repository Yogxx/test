#!/bin/sh

# Script interaktif untuk install/uninstall Nikki & Momo di LuCI
# Bisa dijalankan langsung: wget -O - URL | sh

# Lokasi file Nikki
NIKKI_CONTROLLER="/usr/lib/lua/luci/controller/nikki.lua"
NIKKI_VIEW="/usr/lib/lua/luci/view/backup.htm"

# Lokasi file Momo
MOMO_CONTROLLER="/usr/lib/lua/luci/controller/momo.lua"
MOMO_VIEW="/usr/lib/lua/luci/view/momo.htm"

install_nikki() {
    echo "🚀 Mulai install nikki.lua & backup.htm ke LuCI ..."

    # Download controller
    wget -O "$NIKKI_CONTROLLER" https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/nikki.lua

    # Download view
    wget -O "$NIKKI_VIEW" https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/backup.htm

    # Set permission
    chmod 644 "$NIKKI_CONTROLLER" "$NIKKI_VIEW"

    # Restart LuCI webserver
    /etc/init.d/uhttpd restart

    echo "✅ Install Nikki selesai!"
}

uninstall_nikki() {
    echo "🗑️  Mulai uninstall nikki.lua & backup.htm ..."

    rm -f "$NIKKI_CONTROLLER" "$NIKKI_VIEW"

    /etc/init.d/uhttpd restart
    echo "✅ Uninstall Nikki selesai!"
}

install_momo() {
    echo "🚀 Mulai install momo.lua & momo.htm ke LuCI ..."

    # Download controller
    wget -O "$MOMO_CONTROLLER" https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/momo.lua

    # Download view
    wget -O "$MOMO_VIEW" https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/momo.htm

    chmod 644 "$MOMO_CONTROLLER" "$MOMO_VIEW"

    /etc/init.d/uhttpd restart
    echo "✅ Install Momo selesai!"
}

uninstall_momo() {
    echo "🗑️  Mulai uninstall momo.lua & momo.htm ..."

    rm -f "$MOMO_CONTROLLER" "$MOMO_VIEW"

    /etc/init.d/uhttpd restart
    echo "✅ Uninstall Momo selesai!"
}

echo "=============================="
echo "   Manage LuCI Scripts"
echo "=============================="
echo "1) Install Backup Nikki"
echo "2) Uninstall Backup Nikki"
echo "3) Install Backup Momo"
echo "4) Uninstall Backup Momo"
echo "=============================="
printf "Pilih opsi [1-4]: "

read choice < /dev/tty

case "$choice" in
    1) install_nikki ;;
    2) uninstall_nikki ;;
    3) install_momo ;;
    4) uninstall_momo ;;
    *) echo "❌ Pilihan tidak valid!"; exit 1 ;;
esac
