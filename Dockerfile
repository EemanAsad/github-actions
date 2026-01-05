FROM python:3.8.5-slim-buster

WORKDIR /app

# Copy only requirements first (better for caching)
COPY requirements.txt /app/

# Upgrade pip and install dependencies
RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["python3", "app.py"]