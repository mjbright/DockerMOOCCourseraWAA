FROM ubuntu:saucy
MAINTAINER Michael Bright <dockerfiles@mjbright.net>

RUN apt-get update

ADD .bashrc /root/.bashrc

# Default command
CMD bash

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server
#RUN mkdir /var/run/sshd 
RUN /etc/init.d/ssh start

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tar build-essential curl git-core

# Add Python stuff
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python python-dev python-distribute python-pip

# Add Node.js for Ruby web server:
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs

# Add Ruby Version Manager: RVM
#RUN curl -L https://get.rvm.io | bash -s stable --ruby
RUN curl -L https://get.rvm.io > install_rvm.sh
RUN chmod +x install_rvm.sh

## Ruby installation: takes a while ...
RUN bash -c /install_rvm.sh stable --ruby

RUN bash -lc "rvm list known"
RUN bash -lc "rvm get stable"
RUN bash -lc "rvm install ruby-2.1.0"
RUN bash -lc "rvm use ruby-2.1.0"

## Rails installation: takes a while ...
RUN bash -lc "rvm all do ruby --version"
RUN bash -lc "gem install rails"
RUN bash -lc "rails -v"

RUN adduser --gecos "" --ingroup rvm --disabled-password user
ADD .bashrc /home/user/.bashrc
RUN echo 'user:user' |chpasswd

EXPOSE 22
EXPOSE 3000


