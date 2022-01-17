# python-linux alpine image
FROM python:3.10-alpine

# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1
# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONUNBUFFERED 1

# update pip (python installation package)
RUN pip install --upgrade pip

#needed for msqlclient 
RUN apk add gcc musl-dev mariadb-connector-c-dev

RUN mkdir /website
COPY ./website /website
WORKDIR /website
# django-gunicorn-mysqlcliet
RUN pip install -r requirements.txt

# Initial django
ENTRYPOINT ["sh", "/website/entrypoint.sh"]
