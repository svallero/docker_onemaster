# docker_one
Dockerfiles for containerized OpenNebula installation on CentOS7. 

ONEMASTER:
docker run -d --name onemaster -p 2633:2633 -v yuor_path:/var/log/one svallero/onemaster:latest
