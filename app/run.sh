#!/bin/sh

test_django_app() {
    # check django for issues
    python manage.py check --deploy --fail-level ERROR -v 0
    python manage.py test --noinput -v 0
}

notify_user() {
    if [ "$?" -eq "0" ]; then
        echo "✔️ " $1
    else
        echo "❌ " $2
    fi
}

test_django_app
notify_user "Django checks completed successfully" "Django check failed"

# migrate django
python manage.py migrate --noinput -v 0
notify_user "Migrations applied successfully" "Django migrations failed"

# ensure that MEDIA_ROOT directory exists
if [ ! -d $MEDIA_ROOT ]; then
    mkdir -p $MEDIA_ROOT
    notify_user "Media dir created" "Dir creating failed"
fi

# collect static files
python manage.py collectstatic --noinput -v 0
notify_user "Static files collected successfully" "Unable to collect static"

# launch server
python manage.py runserver $1
