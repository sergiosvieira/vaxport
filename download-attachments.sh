#!/bin/bash
# Author: Prof. MSc Sérgio Vieira <sergio.vieira@ifce.edu.br>

folder=
username=
pass=
output=./pdf
if [ ! -d $output ]; then
    mkdir $output;
else
    rm -rf $output
    mkdir $output
fi
../attachment-downloader/bin/attachment-downloader --filename-template="{{ message_id }}_{{ subject }}" --imap-folder=$folder --host imap.gmail.com --username $username --password $pass --output $output
