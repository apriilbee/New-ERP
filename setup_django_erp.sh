#!/bin/bash

get_mariadb(){
  sudo apt-get update
  sudo apt-get install python-pip python-dev mariadb-server libmariadbclient-dev libssl-dev
  sudo mysql_secure_installation
}
create_database(){
  mysql -u root -p -e "CREATE DATABASE erpnext_django CHARACTER SET UTF8;
  CREATE USER Administrator@localhost IDENTIFIED BY 'password';
  GRANT ALL PRIVILEGES ON erpnext_django.* TO Administrator@localhost;
  FLUSH PRIVILEGES;
  exit"
}

set_app(){
  git clone https://gitlab.com/modernmachines/ERP_Project.git
  cd ~/ERP_Project
  pip install -r requirements.txt
  echo "Done installing requirements"
}

configure_django_db(){
  # cd ~/ERP_Project
  echo "$PWD"
  echo "Making migrations...."
  python manage.py makemigrations
  python manage.py migrate
}

create_superuser(){
  # cd ~/erpnext_django
  echo "Creating superuser...."
  python manage.py createsuperuser
}

main(){
  get_mariadb
  create_database
  set_app
  configure_django_db
  create_superuser
  mysql -u Administrator -p erpnext_django < erpnext_django.sql
}
main $@
