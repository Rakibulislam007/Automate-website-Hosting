#!/bin/bash

#Variable Declaration

PACKAGE=" wget unzip httpd"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2137_barista_cafe.zip'
#ART_NAME='2137_barista_cafe'
TEMPDIR="/tmp/webfiles"

#Installing Dependencies
echo "#################################"
echo "installing packeges"
echo "#################################"
sudo yum install $PACKAGE -y > /dev/null

#Start AND enable services
echo "#################################"
echo "Start & Enable Httpd services"
echo "#################################"

sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

#Creating temp directory
echo "#################################"
echo "Starting artifact deployment"
echo "#################################"

mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > /dev/null

unzip $2.zip > /dev/null

sudo cp -r $2/* /var/www/html/

echo "#################################"
echo "Restarting Httpd services"
echo "#################################"


systemctl restart $SVC

#Cleanup
echo "#################################"
echo "Removing temporary file"
echo "#################################"

rm -rf $TEMPDIR

sudo systemctl status httpd
ls /var/www/html/
