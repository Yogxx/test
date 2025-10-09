#!/bin/sh

# Simple OpenClash status.htm manager untuk OpenWrt

# Versi ringan, kompatibel BusyBox ash

TARGET="/usr/lib/lua/luci/view/openclash/status.htm"
BACKUP="/usr/lib/lua/luci/view/openclash/status.htm.bak"
URL="[https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/status.htm](https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/status.htm)"

echo "=============================="
echo " OpenClash Status File Manager"
echo "=============================="
echo "1) Download dan backup file original"
echo "2) Hapus file baru & restore backup"
echo "=============================="
printf "Pilih opsi (1/2): "
read choice

if [ "$choice" = "1" ]; then
echo "Membuat backup dan mendownload file baru..."
if [ -f "$TARGET" ]; then
cp "$TARGET" "$BACKUP"
echo "Backup disimpan di $BACKUP"
else
echo "File original tidak ditemukan, skip backup."
fi

```
if wget -O "$TARGET" "$URL"; then
    echo "Download selesai ke $TARGET"
else
    echo "Gagal mendownload file!"
fi
```

elif [ "$choice" = "2" ]; then
echo "Menghapus file baru dan mengembalikan file original..."
if [ -f "$BACKUP" ]; then
mv -f "$BACKUP" "$TARGET"
echo "File original telah dikembalikan."
else
echo "Backup tidak ditemukan! Tidak ada yang dikembalikan."
fi

else
echo "Pilihan tidak valid!"
fi
