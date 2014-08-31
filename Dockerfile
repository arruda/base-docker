FROM ubuntu:14.04
maintainer Felipe Arruda "contato@arruda.blog.br"

RUN apt-get -qq update

ADD ./scripts/ /scripts/
RUN chmod +x /scripts/start.sh

VOLUME ['/data']

CMD /scripts/start.sh