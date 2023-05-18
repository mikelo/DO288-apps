FROM python:3.8-alpine

RUN apk add --no-cache \
    gcc g++ musl-dev libffi-dev openssl-dev && \
    python -m pip install --upgrade pip && \
    pip install --no-cache-dir \
    fastapi uvicorn

COPY . /app

WORKDIR /app

EXPOSE 8080

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
