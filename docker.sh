sudo docker pull mcr.microsoft.com/azure-cli:2.57.0
sudo docker ps
sudo docker ps -l
sudo docker ps -q
sudo deocker run
sudo docker image ls

sudo docker run nginx -Pd  

sudo docker run -Pd nginxdemos/hello

sudo docker run --name docker-nginx -p 80:80 nginx

sudo docker container start 88fcace2770f -p 80:80
sudo docker container stop 88fcace2770f


docker ps -a


sudo docker container rm 88fcace2770f

###Se available images
sudo docker image ls
###Se containers
sudo docker ps -l
##Run permanenlty (create a index.html first)
sudo docker run --name docker-nginx -p 80:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx
##Check status
sudo docker ps
sudo docker ps -a



##https://www.digitalocean.com/community/tutorials/how-to-run-nginx-in-a-docker-container-on-ubuntu-22-04
##https://www.cherryservers.com/blog/docker-stop-container
