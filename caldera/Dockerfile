FROM ubuntu:16.04

RUN apt-get update -y

RUN apt-get install mongodb python3-pip python3-dev git wget -y
COPY mongodb.conf /etc/mongodb.conf
RUN mkdir -p /data/db/

RUN mkdir /opt/caldera
RUN git clone https://github.com/mitre/caldera.git /opt/caldera

WORKDIR /opt/caldera/caldera
COPY settings.yaml /opt/caldera/caldera/conf/settings.yaml
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN mkdir -p ../dep/crater/crater
RUN wget https://github.com/mitre/caldera-crater/releases/download/v0.1.0/CraterMainWin8up.exe -O ../dep/crater/crater/CraterMain.exe

COPY start.sh start.sh
RUN chmod +x start.sh

EXPOSE 8888

CMD ["./start.sh"]