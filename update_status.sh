#!/bin/sh
# OpenClash Status.htm Updater by Yogxx

TARGET="/usr/lib/lua/luci/view/openclash/status.htm"
BACKUP="/usr/lib/lua/luci/view/openclash/status.htm.bak"
URL="https://raw.githubusercontent.com/Yogxx/test/refs/heads/main/status.htm"

echo "======================================="
echo "  OpenClash Status.htm Updater"
echo "======================================="
echo "1. Download & Ganti file status.htm"
echo "2. Pulihkan file original (hapus versi custom)"
echo "======================================="
echo -n "Pilih opsi (1/2): "
read pilihan

case "$pilihan" in
    1)
        echo "Membuat backup file lama..."
        if [ -f "$TARGET" ]; then
            cp "$TARGET" "$BACKUP" && echo "Backup disimpan ke $BACKUP"
        else
            echo "File asli tidak ditemukan, lewati backup."
        fi

        echo "Mengunduh file baru..."
        if wget -qO "$TARGET" "$URL"; then
            echo "✅ File berhasil diperbarui!"
        else
            echo "❌ Gagal mengunduh file!"
        fi
        ;;
    2)
        if [ -f "$BACKUP" ]; then
            echo "Mengembalikan file original..."
            mv -f "$BACKUP" "$TARGET"
            echo "✅ File original telah dikembalikan."
        else
            echo "❌ Backup tidak ditemukan!"
        fi
        ;;
    *)
        echo "❌ Pilihan tidak valid!"
        ;;
esac
