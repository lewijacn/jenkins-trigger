FROM python:3.11-slim
COPY /webhook-trigger /webhook-trigger
COPY entrypoint.sh /webhook-trigger
WORKDIR /webhook-trigger

RUN python3 -m pip install --upgrade pipenv && pipenv install --deploy

CMD ["./entrypoint.sh"]
