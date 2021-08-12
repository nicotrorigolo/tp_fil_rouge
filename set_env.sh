#!/bin/bash

echo "Installation de python"
sudo apt update
sudo apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools

echo "Mise en place d'un environnement virtuel"
sudo apt -y install python3-venv
mkdir ~/myproject
cd ~/myproject
python3 -m venv myprojectenv
source myprojectenv/bin/activate

echo "Configuration application Flask"
pip install wheel
pip install gunicorn flask
echo "from flask import Flask
> app = Flask(__name__)
> 
> @app.route("/")
> def hello():
>     return "<h1 style='color:blue'>Hello There!</h1>"
> 
> if __name__ == "__main__":
>     app.run(host='0.0.0.0')" >toto.py
