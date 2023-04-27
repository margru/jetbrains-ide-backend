FROM ubuntu:latest
ENV USERNAME=test
ENV PASSWORD=test
RUN useradd -rm -d /home/${USERNAME} -s /bin/bash -g root -G sudo -u 1000 ${USERNAME}
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y wget
RUN wget https://packages.microsoft.com/config/ubuntu/23.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install openssh-server sudo git curl openjdk-18-jre dotnet-sdk-7.0 -y
RUN dotnet --info
RUN java --version
RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
