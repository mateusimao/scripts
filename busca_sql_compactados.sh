#!/bin/bash

# Caminho base onde os dados estão montados
BASE_DIR="/mnt"
# Caminho base para salvar os arquivos organizados
DEST_DIR="/mnt/recuperados"

# Criação das pastas organizadas por tipo
mkdir -p "$DEST_DIR/sql" "$DEST_DIR/xz" "$DEST_DIR/7z" "$DEST_DIR/bz2" "$DEST_DIR/gz" "$DEST_DIR/zip" "$DEST_DIR/tar"

# Busca e processamento dos arquivos
find "$BASE_DIR" -type f \( -iname "*.sql" -o -iname "*.tar" -o -iname "*.gz" -o -iname "*.bz2" -o -iname "*.zip" -o -iname "*.7z" -o -iname "*.xz" \) | while read arquivo; do
    echo "Verificando: $arquivo"
    case "$arquivo" in
        *.sql)
            echo "Arquivo SQL encontrado: $arquivo"
            cp "$arquivo" "$DEST_DIR/sql/"
            ;;
        *.tar|*.tar.gz|*.tgz)
            echo "Arquivo TAR encontrado: $arquivo"
            cp "$arquivo" "$DEST_DIR/tar/"
            ;;
        *.gz)
            echo "Arquivo GZ encontrado: $arquivo"
            cp "$arquivo" "$DEST_DIR/gz/"
            ;;
        *.bz2)
            echo "Arquivo BZ2 encontrado: $arquivo"
            cp "$arquivo" "$DEST_DIR/bz2/"
            ;;
        *.zip)
            echo "Arquivo ZIP encontrado: $arquivo"
            cp "$arquivo" "$DEST_DIR/zip/"
            ;;
        *.7z)
            echo "Arquivo 7Z encontrado: $arquivo"
            cp "$arquivo" "$DEST_DIR/7z/"
            ;;
        *.xz)
            echo "Arquivo XZ encontrado: $arquivo"
            cp "$arquivo" "$DEST_DIR/xz/"
            ;;
    esac
done
