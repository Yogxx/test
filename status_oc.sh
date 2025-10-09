#!/bin/sh
# Script untuk mengelola status.htm OpenClash

# Lokasi file
TARGET="/usr/lib/lua/luci/view/openclash/status.htm"
BACKUP="/usr/lib/lua/luci/view/openclash/status.htm.bak"
URL="https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/status.htm"

echo "=============================="
echo " OpenClash Status File Manager"
echo "=============================="
echo "1) Download dan backup file original"
echo "2) Hapus file baru & restore backup"
echo "=============================="
read -p "Pilih opsi (1/2): " choice

case $choice in
  1)
    echo "Membuat backup dan mendownload file baru..."
    if [ -f "$TARGET" ]; then
      cp "$TARGET" "$BACKUP"
      echo "Backup disimpan di $BACKUP"
    fi
    wget -O "$TARGET" "$URL" && echo "Download selesai ke $TARGET" || echo "Gagal mendownload file!"
    ;;
  2)
    echo "Menghapus file baru dan mengembalikan file original..."
    if [ -f "$BACKUP" ]; then
      mv -f "$BACKUP" "$TARGET"
      echo "File original telah dikembalikan."
    else
      echo "Backup tidak ditemukan! Tidak ada yang dikembalikan."
    fi
    ;;
  *)
    echo "Pilihan tidak valid!"
    ;;
esac
