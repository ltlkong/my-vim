FROM ubuntu
ENV VIMVERSION=nvim
RUN apt update && \
    apt -y install sudo git wget curl
COPY ./ /root/my.vim/
WORKDIR /root/my.vim/
RUN echo "${VIMVERSION}" | ./install.sh
