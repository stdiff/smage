FROM python:3.7-slim

RUN mkdir /workspace
WORKDIR /workspace
RUN apt-get update
ENV SHELL=/bin/bash
ENV TZ="Europe/Berlin"

##
## Python Environment
##
RUN pip install poetry==1.1.4

RUN poetry config virtualenvs.create false --local
COPY pyproject.toml .
COPY poetry.lock .
RUN poetry install
RUN python -m ipykernel install --sys-prefix
