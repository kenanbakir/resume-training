# Pull official base image
FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y python3-dev build-essential

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/opt/venv



# Pip requirements
RUN pip install --upgrade pip
RUN pip install virtualenv && python3 -m virtualenv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app
