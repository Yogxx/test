#!/bin/sh

echo "🗑️  Mulai uninstall nikki.lua & backup.htm dari LuCI ..."

# Hapus file controller
rm -f /usr/lib/lua/luci/controller/nikki.lua

# Hapus file view
rm -f /usr/lib/lua/luci/view/backup.htm

# Restart LuCI webserver
/etc/init.d/uhttpd restart

echo "✅ Uninstall selesai! File nikki.lua & backup.htm sudah dihapus."
