FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install git -y

# Copy over private key, and set permissions
ADD repo-key /
RUN chmod 600 /repo-key && \  
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \  
  echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config   

RUN apt-get install curl

# install rvm Ruby stable
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby

RUN echo '[[ -s "/usr/local/rvm/bin/rvm" ]] && source "/usr/local/rvm/bin/rvm" > /dev/null' >> ~/.bashrc
