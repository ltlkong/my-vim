FROM ubuntu
RUN apt update && \
    apt -y install sudo git wget
COPY ./ /root/my.vim/
WORKDIR /root/my.vim/nvim/
RUN echo "y" | ./install.sh
