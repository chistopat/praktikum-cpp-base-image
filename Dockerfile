FROM ubuntu:20.04

#prevent warnings
ENV DEBIAN_FRONTEND noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1


RUN apt-get update -qq

RUN apt-get install build-essential -y
RUN apt-get install manpages-dev -y
RUN apt-get install libtbb-dev -y
RUN apt-get install gcc-8 g++-8 gcc-9 g++-9 gcc-10 g++-10 -y
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8


#unset env to default
ENV DEBIAN_FRONTEND newt
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=""