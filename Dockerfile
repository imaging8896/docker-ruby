FROM tzenderman/docker-rvm

RUN apt-get update
RUN apt-get install git ruby -y

# Copy over private key, and set permissions
ADD repo-key /
RUN chmod 600 /repo-key && \  
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \  
  echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config   
