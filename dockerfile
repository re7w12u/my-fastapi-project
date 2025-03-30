FROM python:3.12

# Set the working directory to /app
WORKDIR /app

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

ENV PYTHONPATH=/app

COPY . /app

RUN mkdir -p /logs

EXPOSE 8081

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8081", "--reload"]
