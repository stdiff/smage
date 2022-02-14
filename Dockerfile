FROM python:3.9.10-slim-buster

RUN mkdir /workspace
WORKDIR /workspace
RUN apt-get update
RUN apt-get install -y curl
ENV SHELL=/bin/bash
ENV TZ="Europe/Berlin"

## development environment for sagemaker-training
RUN apt-get install -y build-essential

##
## Python Environment
##
RUN curl -sSL https://install.python-poetry.org | python - --version 1.1.11
ENV PATH=/root/.local/bin:$PATH
RUN poetry config virtualenvs.create false --local
COPY pyproject.toml .
COPY poetry.lock .
RUN poetry install
RUN python -m ipykernel install --sys-prefix
