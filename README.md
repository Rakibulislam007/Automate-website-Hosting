# Automate-website-Hosting
#!/bin/bash

#Installing Dependencies
echo "#################################"
echo "installing packeges"
echo "#################################"
sudo yum install wget unzip httpd -y > /dev/null

#Start AND enable services
echo "#################################"
echo "Start & Enable Httpd services"
echo "#################################"

sudo systemctl start httpd
sudo systemctl enable httpd
echo

#Creating temp directory
echo "#################################"
echo "Starting artifact deployment"
echo "#################################"

mkdir -p /tmp/webfiles
                                                             
cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip > /dev/null

unzip 2137_barista_cafe.zip > /dev/null

sudo cp -r 2137_barista_cafe/* /var/www/html/

echo "#################################"
echo "Restarting Httpd services"
echo "#################################"


systemctl restart httpd

#Cleanup
echo "#################################"
echo "Removing temporary file"
echo "#################################"

rm -rf /tmp/webfiles
#show status of the service
sudo systemctl status httpd
#show content of html
ls /var/www/html/ 

                                                              

