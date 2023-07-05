# Django app template

This app is a simple django app template to speed up development and deployment. The application out of the box can configure django from a dotenv file, has a `Dockerfile` script that automatically builds the docker image of the application, and a configured `run.sh` script, which is the entry point for docker compose.

## Usage

The application can be used in both modes: for local development and for release deployment in docker.

## Installation

### Local

Create and enable python virtual environment

    python -m venv .venv
    .venv/scripts/activate      # windows
    source .venv/bin/activate   # linux

Update `pip` & `setuptools` modules

    pip install -U pip setuptools             # linux
    python -m pip install -U pip setuptools   # windows

Install python dependencies

    pip install -m requirements.txt

Navigate into the core directory

    cd core

Create and configure `.env` environment file from example

    cp .env_example .env
    nano .env

Compile localization files

    python manage.py compilemessages -l <languages>

Launch `run.sh` script

    sh run.sh

### Docker

In your `docker-compose.yml` script add backend service code

```yml
services:
  backend:
    build: <backend directory>
    command: sh run.sh 0.0.0.0:${API_PORT}
    ports:
      - 80:${API_PORT}
```
