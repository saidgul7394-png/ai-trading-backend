FROM python:3.12-slim
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /extract
COPY ai_trading_backend_only.zip .
RUN unzip ai_trading_backend_only.zip && mv ai_trading_app/backend /app && rm -rf /extract
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir -p /app/data
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
