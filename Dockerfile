FROM python:3.11

RUN apt-get update && \
    apt-get install -y clisp swi-prolog


WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 10000

CMD ["gunicorn", "--bind", "0.0.0.0:10000", "app:app"]