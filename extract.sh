#!\bin\bash

for i in $(find . -iname "*.txt"); do
    sed -i -E "s/^[1-9]\/[1-9]//g" $i
    sed -i -E "/^$/d" $i
    sed -i -E "/Ministério da */d" $i
    sed -i -E "/Carteira Nacional*/d" $i
    sed -i -E "/VACINA*COVID-19/d" $i
    sed -i -E "/Vacina\/Profilaxia/d" $i
    sed -i -E "/VACINAS \| SOROS \| DILUENTES ADMINISTRADOS/d" $i
    sed -i -E "/localizada(s)/d" $i
    sed -i -E "/Certificado Nacional */d" $i
    sed -i -E "/Nome/d" $i
    sed -i -E "/Data de Nascimento/d" $i
    sed -i -E "/Sexo$/d" $i
    sed -i -E "/ Nacionalidade/d" $i
    sed -i -E "/CPF ou CNS Brasileiro/d" $i
    sed -i -E "/Doses administradas/d" $i
    sed -i -E "/^\|/d" $i
    sed -i -E "/CNES se refere/d" $i
    sed -i -E "/administrada/d" $i
    sed -i -E "/^CNES/d" $i
    sed -i -E "/Certificado emitido as/,/validacertidao/d" $i
    sed -i -E "/dos Povos Indig/d" $i
    sed -i -E "/Programa Nacional de Imu/d" $i
    sed -i -E "/Carteira de Vacina*emitido as/,/saude\.gov\.br/d" $i
    sed -i -E "/Obs\.:/,/SUS/d" $i
    sed -i -E "s/\r\n/;/g" $i
    sed -i -E ':a;N;$!ba;s/\n//g' $i
    cat $i >> ..\lista.txt
done