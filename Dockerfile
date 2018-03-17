FROM python:3.6-alpine3.6
LABEL maintainer="Peter Pflaeging <peter@pflaeging.net>"
 ENV PYTHONUNBUFFERED 1
 RUN apk --no-cache add gcc libffi xmlsec  zlib zlib-dev musl-dev linux-headers libffi-dev libressl-dev jpeg-dev postgresql-client postgresql-dev
 RUN mkdir /container
 WORKDIR /container/
 ADD requirements.txt /container/
 RUN pip3 install --no-cache-dir -r requirements.txt
 RUN apk --no-cache del jpeg-dev libffi-dev musl-dev zlib-dev python3-dev gcc postgresql-dev
 RUN mkdir /container/media
 RUN mkdir /container/static
 ADD . /container/
 RUN python3 manage.py migrate
 VOLUME /container/media
 VOLUME /container/static
 EXPOSE 8000
 CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
