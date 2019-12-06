FROM python:3.7-stretch

WORKDIR /app

RUN apt-get update && apt-get -y install ca-certificates

COPY requirements.txt /app/

RUN pip install -r requirements.txt 

COPY generate_ssl.sh /app/

RUN ./generate_ssl.sh

COPY sources /app/sources
COPY * /app/

ENTRYPOINT ["python","ServerMain.py","settings.json"]
