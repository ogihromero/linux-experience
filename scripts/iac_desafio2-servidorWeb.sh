#!/bin/bash

echo "Atualizando o servidor"
apt-get update
apt-get upgrade -y

echo "Instalando o Apache e unzip"
apt-get install apache2 -y
apt-get install unzip -y

echo "Baixando e copiando os arquivos do repo para /var/www/html/"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/

echo "Concluído"