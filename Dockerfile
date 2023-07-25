FROM python:3.8.17-bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    python3-pip python3-psycopg2 \
    python3-setuptools python3-wheel libcairo2

WORKDIR /srv/cap-emails

COPY . /srv/cap-emails

RUN pip install -r /srv/cap-emails/backend/requirements/base.txt

EXPOSE 8000
CMD ["python", "backend/manage.py", "runserver", "0.0.0.0:8000"]
