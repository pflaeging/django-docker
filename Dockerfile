FROM python:3.6-alpine3.6
LABEL maintainer="Peter Pflaeging <peter@pflaeging.net>"
 ENV PYTHONUNBUFFERED 1
 RUN apk --no-cache add gcc libffi xmlsec  zlib zlib-dev musl-dev linux-headers libffi-dev libressl-dev jpeg-dev postgresql-client postgresql-dev gettext
 RUN mkdir /container
 WORKDIR /container/
 ADD requirements.txt /container/
 RUN pip3 install --no-cache-dir -r requirements.txt
 RUN apk --no-cache del python3-dev gcc
 RUN mkdir /container/export
 RUN mkdir /container/export/media
 RUN mkdir /container/export/static
 ADD . /container/
 RUN chmod 700 ./runner.sh
 RUN chmod 700 ./replacer.sh
 VOLUME /container/export
 EXPOSE 8000
 CMD [ "/container/runner.sh" ]
