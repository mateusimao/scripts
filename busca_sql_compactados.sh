#!/bin/bash
# Encontre arquivos compactados e arquivos .sql
find . -type f \( -iname "*.sql" -o -iname "*.tar" -o -iname "*.gz" -o -iname "*.bz2" -o -iname "*.zip" -o -iname "*.7z" -o -iname "*.xz" \) | while read arquivo; do
    echo "Verificando: $arquivo"
    case "$arquivo" in
        *.sql)
            echo "Arquivo SQL encontrado: $arquivo"
            ;;
        *.tar|*.tar.gz|*.tgz)
            echo "Verificando arquivos em $arquivo..."
            tar -tf "$arquivo" | grep -i ".sql" && echo "Arquivo .sql encontrado dentro: $arquivo"
            ;;
        *.zip)
            echo "Verificando arquivos em $arquivo..."
            unzip -l "$arquivo" | grep -i ".sql" && echo "Arquivo .sql encontrado dentro: $arquivo"
            ;;
        *.gz)
            echo "Verificando arquivos em $arquivo..."
            gzip -cd "$arquivo" | grep -i ".sql" && echo "Arquivo .sql encontrado dentro: $arquivo"
            ;;
        *.bz2)
            echo "Verificando arquivos em $arquivo..."
            bzip2 -cd "$arquivo" | grep -i ".sql" && echo "Arquivo .sql encontrado dentro: $arquivo"
            ;;
        *.7z)
            echo "Verificando arquivos em $arquivo..."
            7z l "$arquivo" | grep -i ".sql" && echo "Arquivo .sql encontrado dentro: $arquivo"
            ;;
        *.xz)
            echo "Verificando arquivos em $arquivo..."
            xz -cd "$arquivo" | grep -i ".sql" && echo "Arquivo .sql encontrado dentro: $arquivo"
            ;;
    esac
done
