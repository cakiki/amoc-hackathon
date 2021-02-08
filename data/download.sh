#!/bin/bash
fileid="1ccXju1ZkyqKn8yBZV4TPkz166JRWKg3F"
filename="hackathon_dataset.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
