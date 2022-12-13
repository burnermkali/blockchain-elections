#!/bin/bash

# Pull the latest nginx image from Docker Hub
docker pull nginx

# Create a new Docker container based on the nginx image
docker create --name blockchain-africa nginx

# Copy the HTML and CSS files for your static website into the container
docker cp /home/tjoa/blockchainelections/index.html blockchain-africa:/usr/share/nginx/html
docker cp /home/tjoa/blockchainelections blockchain-africa:/usr/share/nginx/html

sudo docker cp /home/tjoa/blockchainelections/findoutmore.html blockchain-africa:/usr/share/nginx/html
sudo docker cp /home/tjoa/blockchainelections/contactus.html blockchain-africa:/usr/share/nginx/html
sudo docker cp /home/tjoa/blockchainelections/app.css blockchain-africa:/usr/share/nginx/html
sudo docker cp /home/tjoa/blockchainelections/logo.png blockchain-africa:/usr/share/nginx/html


# Start the Docker container
docker start blockchain-africa

#connect to the docker container via the internet
sudo docker run -d -p 80:80 --name blockchain-africa nginx

#connect to blockchain-africa container shell
sudo docker exec -it blockchain-africa /bin/bash

#find ip address for blockchain-africa container
sudo docker inspect blockchain-africa | grep IPAddress
