FROM ubuntu:14.04.2
MAINTAINER Doug Collier <doug@doucol.me>
RUN apt-get update && apt-get install postfix dovecot-pop3d
