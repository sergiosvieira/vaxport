# Vaxport
### Autor: Prof. MSc. Sérgio Vieira - <sergio.vieira@ifce.edu.br>
Vaxport é uma solução computacional idealizada para baixar e converter pdfs de passaportes vacinais em um único arquivo JSON bem estruturado.
## Configurações Iniciais
### *Pré-requisito*: Você precisa ter criado um marcado no GMAIL para filtrar as mensagens enviadas pelos alunos/servidores.
---
1. Especificar o nome do marcador no Gmail pré-configurado para receber os passaportes vacinais
``` 
Dentro do arquivo download-attachment.sh, procure o trecho --imap-folder=, depois do símbolo de igualdade coloque o nome do marcador (não precisa de aspas)
```
2. Especificar o email de onde serão baixados os PDFs
```
Dentro do arquivo download-attachment.sh, procure o trecho --username, depois dele coloque um espaço e escreva o seu email 
```
3. Especificar a senha do seu email anteriormente configurado
* Antes de configurar o comando abaixo, é necessário criar uma nova senha de aplicação no GMAIL
* https://support.google.com/accounts/answer/185833?hl=pt-BR 
```
Dentro do arquivo download-attachment.sh, procure o trecho --password, depois dele coloque um espaço e digite a senha de aplicativo gerada
```
4. Especificar a pasta de destino, onde serão salvos os PDFs
```
Dentro do arquivo download-attachment.sh, procure o trecho --output, depois dele coloque um espaço e digite o caminho da pasta de destino
```
5. Para que esta solução funcione é necessário ativar o IMAP no GMAIL
* Ativando IMAP no GMAIL: https://support.google.com/mail/answer/7126229?hl=pt-BR 
6. O Próximo passo é instalar os seguintes aplicativos
* CYGWIN com os seguintes pacotes:
    - python3
    - git
7. Depois de tudo instalado, abra o terminal do cygwin e digite:
```
git clone https://github.com/sergiosvieira/vaxport.git
```
8. Ainda dentro do terminal do cygwin digite:
```
git clone https://github.com/sergiosvieira/downloader-attachment.git
cd downloader-attachment/
python setup.py install
cd ..
```
9. Entre dentro da pasta vaxport através do seguinte comando:
```
cd vaxport
```
10. Execute a aplicação
```
sh start.sh
```
11. Se tudo estiver configurado corretamente a aplicação fará:
* Baixar do GMAIL todos os pdfs dos passaportes vacinais
* Renomear os pdfs
* Converter os pdfs em texto
* Remover os caracteres desnecessários
* Mesclar todos os passaportes vacinais em um único arquivo texto (passaporte.txt)
* Converter em JSON (passaporte.json)
12. Exemplo de JSON criado
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