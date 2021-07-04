  
FROM python:3.6-alpine



WORKDIR /app

ADD . /app


RUN pip install -r requirements.txt

EXPOSE 3000


COPY scripts/runapp.sh /usr/bin/

ADD supervisor/app.conf /etc/supervisor/conf.d/

RUN chmod 755 /usr/bin/runapp.sh

ENV MYSQL_USERNAME="root"
ENV MYSQL_PASSWORD="12345"
ENV MYSQL_INSTANCE_NAME="pythonapp"
ENV MYSQL_PORT_3306_TCP_ADDR="mydb"
ENV MYSQL_PORT_3306_TCP_PORT=3306


CMD ["/usr/bin/runapp.sh", "-n"]

