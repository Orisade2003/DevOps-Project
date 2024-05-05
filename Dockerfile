FROM python:3.9-alpine
WORKDIR /app
COPY fastAPI/requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8080
ENTRYPOINT ["uvicorn", "main:app","--host", "0.0.0.0", "--port", "8080"]