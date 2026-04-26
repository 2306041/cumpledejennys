#!/bin/bash
# Corre este script cada vez que agregues fotos nuevas a la carpeta fotos/
# Uso: bash actualizar-fotos.sh

cd "$(dirname "$0")"

echo "[" > fotos/fotos.json
files=(fotos/*.jpg fotos/*.jpeg fotos/*.png fotos/*.webp)
last=${files[@]: -1}
for f in "${files[@]}"; do
  name=$(basename "$f")
  if [ "$f" = "$last" ]; then
    echo "  \"$name\"" >> fotos/fotos.json
  else
    echo "  \"$name\"," >> fotos/fotos.json
  fi
done
echo "]" >> fotos/fotos.json

echo "✅ fotos.json actualizado con $(ls fotos/*.jpg fotos/*.jpeg fotos/*.png fotos/*.webp 2>/dev/null | wc -l) fotos"
