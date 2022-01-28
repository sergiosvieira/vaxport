#!/bin/bash

echo "[+] Juntando em um arquivo só..."
rm -rf passaporte.txt
for i in $(ls *.txt); do
    cat $i >> passaporte.txt
done

