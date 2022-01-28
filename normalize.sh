#!\bin\bash
folder=$1
for i in $(ls $folder/*.txt); do
    echo $i
    sed -i -E 's/ +/ /g' $i
    sed -i -E '1,8d' $i
    sed -i -E '/^CNES/d' $i
    sed -i -E 's/ Data de Nascimento//g' $i
    sed -i -E '/ Sexo/d' $i
    sed -i -E 's/ Masculino//g' $i
    sed -i -E 's/ Feminino//g' $i
    sed -i -E '/Nome da M/d' $i
    sed -i -E '/CPF ou CNS/d' $i
    sed -i -E 's/ Nacionalidade//g' $i
    sed -i -E '/Doses administradas/d' $i
    sed -i -E '/Data Vacina/d' $i
    sed -i -E 's/ BRASILEIR[OA]//g' $i
    sed -i -E 's/ Brasileir[oa]//g' $i
    sed -i -E 's/ MASCULINO|FEMININO//g' $i
    sed -i -E '/\* O nome da vacina/d' $i
    sed -i -E '/^ VACINA/d' $i
    sed -i -E '/Vacina\/Profilaxia/d' $i
    sed -i -E '/comercial do produto/d' $i
    sed -i -E '/.*localizada/d' $i
    sed -i -E '/Carteira de Vacina.*/d' $i
    sed -i -E '/\*\* CNES/,/administrada\./d' $i
    sed -i -E '/Certificado/,/validacertidao/d' $i
    sed -i -E '/Esta carteira/,/saude\.gov\.br/d' $i
    sed -i -E '/\* CNES/,$d' $i
    sed -i -E '/Obs\.:/,/para fins /d' $i
    sed -i -E 's/[^[:print:]\t]//g' $i
    sed -i -E '/Ministério/d' $i
    sed -i -E 's/Refor▒o/Reforco/g' $i
    sed -i '/^[[:space:]]*$/d' $i
done