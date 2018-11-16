FROM phusion/baseimage:0.11
MAINTAINER Damien Garros <dgarros@gmail.com>

## Update container OS
RUN     apt-get -y update && \
        apt-get -y install \
            build-essential \
            python-simplejson \
            python-dev \
            python-yaml \
            python-pip \
            python-dev \
            libxml2-dev \
            libxslt-dev \
            tcpdump \
            tree \
            nginx-light \
            snmp \
            zlib1g-dev \
            libffi-dev \
            libssl-dev && \
        apt-get clean   &&\
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN     pip install --upgrade setuptools

## Install some python modules
RUN     pip install influxdb && \
        pip install xmltodict && \
        pip install pexpect && \
        easy_install pysnmp && \
        pip install lxml && \
        pip install python-crontab && \
        pip install pytest && \
        pip install mock && \
        pip install cryptography==2.1.2 && \
        pip install junos-eznc==2.1.7 && \
        pip install enum

## open-nti python scripts (for gathering information from server to router)
ADD     ./open-nti.py /opt/open-nti/open-nti.py
ADD     ./startcron.py /opt/open-nti/startcron.py
ADD     ./tests/main/pyez_mock.py /opt/open-nti/pyez_mock.py

## Add test files
RUN     mkdir /opt/open-nti/tests

CMD ["/sbin/my_init"]
