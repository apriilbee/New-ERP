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

install_frappe(){
  echo "$PWD"
  cd ..
  wget https://raw.githubusercontent.com/flomente96/bench-mirror/master/install_scripts/setup_frappe.sh
  sudo bash setup_frappe.sh --setup-production
}

main(){
  get_mariadb
  create_database
  set_app
  configure_django_db
  # upon installation, this app already has a django superuser [username: Administrator, password: password123]
  # create_superuser
  echo "Initial password: password"
  mysql -u Administrator -p erpnext_django < erpnext_django.sql
  install_frappe
}
main $@
