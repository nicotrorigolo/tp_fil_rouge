FROM ubuntu:latest

# Installation de python et des dépendances
RUN apt update -y
RUN apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools

# Installation de nginx
RUN apt update
# Empecher le tzdata d'interompre le programme. le tzdata demande a l'utilisateur sa zone geographique 
# Le tzdata intervient dans l'installation de nginx via dockerfile
ARG DEBIAN_FRONTEND=noninteractive 
RUN apt install -y nginx 

# Installation de git
RUN apt install -y git

# Telechargement des fichiers github
RUN git clone https://github.com/nicotrorigolo/tp_fil_rouge

# Installation de wheel
RUN pip install wheel

# Installation de gunicorn
RUN pip install gunicorn

# Installation de flask
RUN pip install flask

# Configuration du parfeu, on indique au pare-feu que l'acces au port 5000 est autorise
#RUN ufw allow 5000

# Mise en place du dossier de travail
RUN mv /tp_fil_rouge/debut.py /
RUN mv /tp_fil_rouge/demarreur.sh /
RUN mv /tp_fil_rouge/wsgi.py /
RUN chmod 755 demarreur.sh

# Mise en place de l'environement de DEV ou de PROD
ENV APP_ENVIRONMENT PROD

# Port d'exposition
EXPOSE 5000

# Lancement de l'application
CMD [ "./demarreur.sh" ]