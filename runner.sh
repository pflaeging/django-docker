#! /bin/sh

/container/replacer.sh

chmod 755 /container/additional.sh
/container/additional.sh

python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8000
