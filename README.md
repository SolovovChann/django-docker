# django-template

## Installation

### Local

Create python virtual environment

    python -m venv .venv

Update `pip` & `setuptools` modules

    pip install -U pip setuptools

Install python dependencies

    pip install -m requirements.txt

Navigate into the core directory

    cd core

Create and configure `.env` environment file from example

    cp .env_example .env
    nano .env

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
