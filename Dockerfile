FROM ubuntu:14.04
MAINTAINER Doug Collier <doug@doucol.me>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    postfix \
    dovecot-pop3d \
    mailutils \
    supervisor

RUN sed -i -re"s/#submission inet n(\ )+-(\ )+-(\ )+-(\ )+-(\ )+smtpd/submission inet n       -       -       -       -       smtpd/g" /etc/postfix/master.cf

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 25
EXPOSE 995

CMD ["/usr/bin/supervisord"]
