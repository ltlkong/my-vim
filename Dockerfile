FROM ubuntu:devel
ENV VIMVERSION=nvim
RUN apt update && \
    apt -y install sudo git wget curl gcc g++
COPY ./ /root/my.vim/
WORKDIR /root/my.vim/
