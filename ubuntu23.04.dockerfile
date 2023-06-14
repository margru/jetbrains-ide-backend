FROM ubuntu:22.04
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget
RUN wget https://packages.microsoft.com/config/ubuntu/23.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update && apt-get -y upgrade
RUN apt-get install openssh-server sudo git curl openjdk-18-jre dotnet-sdk-7.0 build-essential python3-dev -y
RUN rm -rf /var/lib/apt/lists/*
RUN dotnet --info
RUN java --version
RUN service ssh start
RUN ln -sf /dev/stdout /var/log/syslog
EXPOSE 22
ENV USER_ID=999
COPY scripts/runtime.sh .
RUN chmod a+x runtime.sh
CMD ["./runtime.sh"]
