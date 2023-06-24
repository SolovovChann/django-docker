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

# collect static files
python manage.py collectstatic --noinput

echo "
>> Static files collected successfully
"

# launch server
python manage.py runserver $1
