FROM python:3.11-slim
COPY /webhook-trigger /webhook-trigger
COPY entrypoint.sh /webhook-trigger
WORKDIR /webhook-trigger

RUN python3 -m pip install --upgrade pipenv && pipenv install --deploy

# Setup venv for interactive access
RUN echo '. /.venv/bin/activate' >> /etc/profile.d/venv.sh
RUN echo '. /etc/profile.d/venv.sh' >> ~/.bashrc
# Set ENV to control startup script in /bin/sh mode
ENV ENV=/root/.bashrc

CMD ["./entrypoint.sh"]
