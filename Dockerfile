FROM centos:latest

COPY opennebula.repo /etc/yum.repos.d/opennebula.repo
COPY start.sh /

# Keep in 2 steps or one-server dependencies are not found in this repo
RUN yum install -y epel-release
# (below: dirty hack or one-server wont't install)
RUN rm -rf  /var/lock 
RUN yum install -y opennebula-server redhat-lsb

# Install rubygems required by ON, always answer yes to install script
RUN yes | /usr/share/one/install_gems

# Set env for ON authentication
ENV ONE_AUTH=/root/.one_aut
# (below: should be changed when running the container)
ENV ONE_PASSWORD=password 
RUN echo oneadmin:${ONE_PASSWORD} > ${ONE_AUTH}
 
RUN chown -R oneadmin /var/log/one /var/lock/one /var/run/one

# Where is the sqlite database written? Should it go in some persistent volume?
VOLUME [/var/log/one]

EXPOSE 2633

# Must run the 2 services (oned and scheduler) on same container because
# asof ON 4 the XMLRPC endpoint cannot be specified in the scheduler configuration. 
# The feature should be there in ON 5. 
#CMD ["/usr/bin/oned","&&","/usr/bin/mm_sched"] 
#CMD ["one","start","&&","tail","-f","/var/log/one/oned.log"] 
CMD ["/start.sh"] 
