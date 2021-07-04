  
FROM python:3.6-alpine

EXPOSE 3000

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt

ENV MYSQL_USERNAME="root"
ENV MYSQL_PASSWORD="12345"
ENV MYSQL_INSTANCE_NAME="pythonapp"
ENV MYSQL_PORT_3306_TCP_ADDR="192.168.1.202"
ENV MYSQL_PORT_3306_TCP_PORT=3306


COPY app.py /app
CMD python app.py
