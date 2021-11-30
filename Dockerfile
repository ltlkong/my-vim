FROM ubuntu
RUN apt update && \
    apt -y install sudo git wget curl
COPY ./ /root/my.vim/
WORKDIR /root/my.vim/
RUN echo "vim" | ./install.sh
