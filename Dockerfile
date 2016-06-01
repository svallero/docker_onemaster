FROM svallero/docker_onebase:latest

# Where is the sqlite database written? Should it go in some persistent volume?
VOLUME [/var/log/one]

EXPOSE 2633

# Must run the 2 services (oned and scheduler) on same container because
# asof ON 4 the XMLRPC endpoint cannot be specified in the scheduler configuration. 
# The feature should be there in ON 5. 
CMD ["/start.sh"] 
