FROM python:3.11-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code/django

COPY requirements.txt .
RUN pip install -U pip && pip install -r requirements.txt

COPY app .
