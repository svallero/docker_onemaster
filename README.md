# docker_onemaster
Dockerfiles for containerized OpenNebula installation on CentOS7. 

The container runs both the main daemon and the scheduler, since up to ONE release 4 it is not possible to specify an XML-RPC endpoint for the scheduler other than localhost (http://dev.opennebula.org/issues/4404). Sould be fixed in release 5. 

    docker run -d --name onemaster -e ONE_PASSWORD=mypassword -p 2633:2633 -v your_path:/var/log/one svallero/onemaster:latest
