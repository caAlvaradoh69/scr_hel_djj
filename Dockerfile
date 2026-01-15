FROM mcr.microsoft.com/playwright/python:v1.57.0-jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Santiago

RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/America/Santiago /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN pip install -r requirements.txt

CMD ["python", "main.py"]