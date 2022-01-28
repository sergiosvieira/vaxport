#!\bin\bash

j=0
folder=$1
for i in $(ls $folder/*.pdf); do
    mv "$i" $folder/$j.pdf
    j=$((j+1))
done