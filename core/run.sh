#!/bin/sh

# check django for issues
python manage.py check --deploy --fail-level ERROR
python manage.py test --noinput

echo "
>> Django checks completed successfully
"

# migrate django
python manage.py migrate --noinput

echo "
>> Migrations applied successfully
"

# ensure that MEDIA_ROOT directory exists
if [ ! -d $MEDIA_ROOT ]; then
    echo ">> Trying to create MEDIA_ROOT directory"
    mkdir -p $MEDIA_ROOT
fi

# collect static files
python manage.py collectstatic --noinput

echo "
>> Static files collected successfully
"

# launch server
python manage.py runserver $1
