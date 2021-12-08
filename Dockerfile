FROM python:3.8-slim

WORKDIR /app/django_demo

COPY $PWD/pyproject.toml $PWD/poetry.lock ./

RUN apt-get update && \
  apt-get install -y curl gcc libmariadb-dev && \
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python && \
  export PATH=$HOME/.poetry/bin:$PATH && \
  poetry config virtualenvs.in-project true && \
  poetry install

ENV PATH /root/.poetry/bin:$PATH