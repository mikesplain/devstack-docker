# DevStack
# http://devstack.org/
#
# VERSION       0.1.0

FROM ubuntu
MAINTAINER Mike Splain mike.splain@gmail.com

RUN apt-get update; apt-get install build-essential git -y;

RUN git clone https://github.com/openstack-dev/devstack.git

RUN cd devstack;

RUN /devstack/tools/create-stack-user.sh

RUN su - stack -c 'git clone https://github.com/openstack-dev/devstack.git'

RUN su - stack -c 'cd devstack; ./stack.sh'

EXPOSE 80

ENTRYPOINT ["/bin/bash"]
