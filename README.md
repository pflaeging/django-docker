# Django Docker container

For use with django 2.

Included is (for details look at requirements.txt):
- django 2
- djangorestframework -> REST
- django-saml2-auth -> SAML2
- stripe -> Payment provider
- Pillow -> Use Images
- psycopg2 -> PostgreSQL
- xhtml2pdf -> Generate PDF from templates

## Generate container for your own app

1. Create a Dockerfile:
```
FROM pflaeging/django:latest
 ADD ./myapp/ /container/
 RUN python3 manage.py migrate
 VOLUME /container/export
 EXPOSE 8000
 CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
 ```
2. Put your django project under ./myapp/
3. generate your docker container
4. Done ;-)

## Comments for your app!

- Place all static files and media under /export -> easy to serve with proxy nginx
- use postgres as DB
- use nginx in front of app for static files
