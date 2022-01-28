# Vaxport
### Autor: Prof. MSc. Sérgio Vieira - <sergio.vieira@ifce.edu.br>
Vaxport é uma solução computacional idealizada para baixar e converter pdfs de passaportes vacinais em um único arquivo JSON bem estruturado.

### *Atenção*: este sistema é um protótipo, precisam ser realizados mais testes com diferentes passaportes vacinais.
## Configurações Iniciais
### *Pré-requisitos*: Você precisa ter ativado o IMAP no GMAIL, cirado uma senha de aplicação e criado um marcado para filtrar as mensagens enviadas pelos alunos/servidores.
* Ativando IMAP no GMAIL: https://support.google.com/mail/answer/7126229?hl=pt-BR
* Criar uma nova senha de aplicação no GMAIL - https://support.google.com/accounts/answer/185833?hl=pt-BR
* Criando marcadores e filtrando no GMAIL - https://support.google.com/mail/answer/6579?hl=pt-BR
---
1. Especificar o nome do marcador no GMAIL
``` 
Dentro do arquivo download-attachments.sh, procure o trecho folder=, 
depois do símbolo de igualdade coloque o nome do marcador.
(não precisa de aspas e nem espaços depois da igualdade)
```
2. Especificar o email de onde serão baixados os PDFs
```
Dentro do arquivo download-attachments.sh, procure o trecho username=, 
depois do símbolo de igualdade escreva o seu email.
(não precisa de aspas e nem espaços depois da igualdade)
```
3. Especificar a senha do seu email anteriormente configurado
```
Dentro do arquivo download-attachments.sh, procure o trecho pass=, 
depois do símbolo de igualdade coloque a senha de aplicativo gerada.
(não precisa de aspas e nem espaços depois da igualdade)
```
4. Especificar a pasta de destino, onde serão salvos os PDFs
```
Dentro do arquivo download-attachments.sh, procure o trecho output=, 
depois do símbolo de igualdade coloque o caminho da pasta de destino
onde serão salvos os arquivos pdf.
(não precisa de aspas e nem espaços depois da igualdade)
```
* Ao final, você dever ter um comando, dentro do arquivo downloader-attachments.sh, parecido com o abaixo
```bash
#!/bin/bash
# Author: Prof. MSc Sérgio Vieira <sergio.vieira@ifce.edu.br>

folder=certificados
username=email@ifce.edu.br
pass=senha1234
output=./pdf
if [ ! -d $output ]; then
    mkdir $output;
else
    rm -rf $output
    mkdir $output
fi
../attachment-downloader/bin/attachment-downloader --filename-template="{{ message_id }}_{{ subject }}" --imap-folder=$folder --host imap.gmail.com --username $username --password $pass --output $output
```
5. O próximo passo é instalar os seguintes aplicativos
* cygwin com os seguintes pacotes:
    - python3
    - git
* Como instalar o cygwin e seus pacotes - https://gist.github.com/AllanNozomu/6b108324f9c72285adb2c77499cad4b8
* Mais informações sobre o cygwin - https://www.youtube.com/watch?v=TFCCriN_MvU
6. Depois de tudo instalado e configurado, abra o terminal do cygwin e digite:
```
git clone https://github.com/sergiosvieira/vaxport.git
```
7. Ainda dentro do terminal do cygwin digite:
```
git clone https://github.com/sergiosvieira/attachment-downloader.git
cd attachment-downloader
python setup.py install
cd ..
```
8. Entre dentro da pasta vaxport através do seguinte comando:
```
cd vaxport
```
9. Execute a aplicação
```
sh start.sh
```
10. Se tudo estiver configurado corretamente o sistema irá:
```
[+] Baixar do GMAIL todos os pdfs dos passaportes vacinais do marcador configurado
{+] Renomear os pdfs
[+] Converter os pdfs em texto
[+] Remover os caracteres desnecessários dos textos convertidos
[+] Mesclar todos os passaportes vacinais textuais em um único arquivo (passaporte.txt)
    * As informações dentro de passaporte.txt não estão estruturadas
[+] Converter em JSON o arquivo passapaorte.txt (passaporte.json)
    * Depois deste passo as informações estarão semiestruturadas sendo possível
      utilizá-las em uma gama de aplicações diferentes
```
11. Exemplo de JSON criado
```
{
  "rows": [
    {
      "name": "FULADO DA SILVA",
      "birth": "01/01/1900",
      "cpf": "123.123.123-12",
      "mother": "FULANA DA SILVA",
      "key": "ZZZZ.AAAA.BBBB.CCCC",
      "vaccines": [
        {
          "date": "01/01/2021",
          "name": "COVID-19 PFIZER - COMIRNATY",
          "manufacturer": "PFIZER",
          "dose": "Reforço",
          "batch": "XXNNNN",
          "cnes": "NNNNNN"
        },
        {
          "date": "01/01/2021",
          "name": "COVID-19 PFIZER - COMIRNATY",
          "manufacturer": "PFIZER",
          "dose": "2/2",
          "batch": "XXNNNN",
          "cnes": "NNNNNN"
        },
        {
          "date": "01/01/2021",
          "name": "COVID-19 PFIZER - COMIRNATY",
          "manufacturer": "PFIZER",
          "dose": "1/2",
          "batch": "XXNNNN",
          "cnes": "NNNNNN"
        }
      ]
    }
}
```
### Para visualizar melhor as informações você pode copiar o conteúdo do arquivo *passaporte.json* e colar em http://json2table.com/ para visualizar as informações em formato de tabela ou árvore.
### Para converter de arquivo json para csv ou xls basta copiar o conteúdo do arquivo *passaporte.json" e colar em https://data.page/json/csv.
