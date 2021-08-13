#!/bin/bash

echo "Installation de python"
sudo apt update
sudo apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools

echo "Téléchargement des fichiers github"
git clone https://github.com/nicotrorigolo/tp_fil_rouge

echo "Mise en place d'un environnement virtuel"
sudo apt -y install python3-venv
mkdir ~/myproject
cd ~/myproject
mv /home/vagrant/tp_fil_rouge/debut.py .
mv /home/vagrant/tp_fil_rouge/wsgi.py
python3 -m venv myprojectenv
source myprojectenv/bin/activate

echo "Configuration application Flask"
pip install wheel
pip install gunicorn flask
sudo ufw allow 5000 # Indication au pare-feu que l'acces au port 5000 est autorise

#echo "Verification que l'application fonctionne"
#curl 192.168.100.50:5000 # 192.168.100.50 c'est l'adresse IP de la VM master, 5000 c'est le port de l'application

echo "Configuration Gunicorn"
gunicorn --bind 0.0.0.0:5000 wsgi:app