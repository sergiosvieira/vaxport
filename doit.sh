#!/bin/bash
# Author: Prof. MSc Sérgio Vieira <sergio.vieira@ifce.edu.br>
folder=$1
echo "[+] Renomeando pdfs..."
sh rename.sh $folder
echo "[+] Convertendo em texto..."
for i in $(ls $folder/*.pdf); do
    ./pdftotext -l 1 -table $i
done
echo
echo "[+] Removendo textos desnecessários..."
sh normalize.sh $folder
#echo "[+] Removendo quebras de linha..."
#for i in $(ls *.txt); do
#    sed -i -E ':a;N;$!ba;s/\n/;/g' $i
#done
echo "[+] Mesclando todos em um arquivo só..."
rm -rf passaporte.txt
for i in $(ls $folder/*.txt); do
    cat $i >> passaporte.txt
done
echo "[+] Criando JSON..."
rm -rf passaporte.json
./reestructure.exe < passaporte.txt >> passaporte.json
