FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install git -y

# Copy over private key, and set permissions
ADD repo-key /

RUN chmod 600 /repo-key && \  
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \  
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config   

RUN apt-get install curl

# install rvm Ruby stable
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby

RUN echo '[[ -s "/usr/local/rvm/bin/rvm" ]] && source "/usr/local/rvm/bin/rvm" > /dev/null' >> ~/.bashrc

# install rubyGem
RUN apt-get install rubygems -y

# remove ssh config echo additional '-e' 
RUN sed -i -- 's/-e//g' /etc/ssh/ssh_config

# install ruby 2.3.3

RUN /bin/bash -l -c 'rvm install 2.3.3 && rvm use 2.3.3'

RUN /bin/bash -l -c 'rvm --default use 2.3.3'
RUN ruby -v
ENV PATH=$PATH:/usr/local/rvm/bin
RUN apt-get install -y ruby-dev

# pre-install gem
ADD Gemfile /
RUN gem install bundle
RUN bundle install
