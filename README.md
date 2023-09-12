# Django app template

This app is a simple django app template to speed up development and deployment. The application out of the box can configure django from a dotenv file, has a `Dockerfile` script that automatically builds the docker image of the application, and a configured `run.sh` script, which is the entry point for docker compose.

## Usage

The application can be used in both modes: for local development and for release deployment in docker.

Note: The `.env` file contains the settings for **development and debugging**. In the docker compose settings file, you can overwrite them with data used for production (for example, using a production database and turning off debug mode).

## Installation

### Local

Create and enable python virtual environment

    python -m venv .venv
    source .venv/bin/activate   # linux
    .venv/scripts/activate      # windows

Update `pip` & `setuptools` modules

    pip install -U pip setuptools             # linux
    python -m pip install -U pip setuptools   # windows

Install python dependencies

    pip install -r requirements.txt

Navigate into the core directory

    cd core

Create and configure `.env` environment file from example

    cp .env_example .env
    nano .env

To generate the secret key you can use [duckduckgo](https://duckduckgo.com/?q=password+50+strong&ia=answer) or paste the next command in terminal

    python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"

Compile localization files

    python manage.py compilemessages -l <languages>

If you do not have the gettext utility pre-installed, you can download the latest version from the official [GNU gettext website](https://www.gnu.org/software/gettext/#downloading).

Launch `run.sh` script (linux only)

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
