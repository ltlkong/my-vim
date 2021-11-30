FROM ubuntu
ENV VIMVERSION=vim
RUN apt update && \
    apt -y install sudo git wget curl
COPY ./ /root/my.vim/
WORKDIR /root/my.vim/
RUN echo "${VIMVERSION}" | ./install.sh
