#!/bin/bash

# URL de la página web
#url="https://tvinnov.online/Peliculas/"
url='http://pilarika.no-ip.org/Cine/Cine_01/'

# Nombre del archivo de salida
output_file="videos.m3u"

# Obtener el contenido de la página web
content=$(curl -s "$url")

# Extraer los enlaces de video utilizando expresiones regulares
video_links=$(echo "$content" | grep -Eo 'href="([^"#]+\.mp4)"' | cut -d'"' -f2)

# Crear el archivo de salida y escribir los enlaces de video
echo "#EXTM3U" > "$output_file"
for link in $video_links; do
  echo "#EXTINF:0,$link" >> "$output_file"
  echo "$url$link" >> "$output_file"
done

echo "Se han extraído los enlaces de video y se han guardado en el archivo $output_file."
