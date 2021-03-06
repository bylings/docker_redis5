FROM centos
RUN groupadd -r redis && useradd -r -g redis redis
RUN yum update -y ; \
    yum -y install gcc automake autoconf libtool make wget epel-release gcc-c++;
RUN mkdir -p /usr/src/redis; \
    wget https://github.com/antirez/redis/archive/5.0.7.tar.gz; \
    tar -zxvf 5.0.7.tar.gz -C /usr/src/redis; \
    rm -rf 5.0.7.tar.gz

RUN cd /usr/src/redis/redis-5.0.7 && make && make PREFIX=/usr/local/redis install;
