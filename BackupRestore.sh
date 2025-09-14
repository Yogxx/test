#!/bin/sh

echo "🚀 Mulai install nikki.lua & backup.htm ke LuCI ..."

# Download controller
wget -O /usr/lib/lua/luci/controller/nikki.lua https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/nikki.lua

# Download view
wget -O /usr/lib/lua/luci/view/backup.htm https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/backup.htm

# Set permission
chmod 644 /usr/lib/lua/luci/controller/nikki.lua
chmod 644 /usr/lib/lua/luci/view/backup.htm

# Restart LuCI webserver
/etc/init.d/uhttpd restart

echo "✅ Install selesai! Silakan buka LuCI untuk cek menu baru."
