#!/bin/bash
# Author: Prof. MSc Sérgio Vieira (sergio.vieira@ifce.edu.br)
echo "Vaxport - Extrator de informações úteis de passaportes vacinais"
echo "Autor: Prof. MSc. Sérgio Vieira <sergio.vieira@ifce.edu.br>"
echo "==============================================================="

sh clean.sh && sh download-attachments.sh && sh doit.sh ./pdf