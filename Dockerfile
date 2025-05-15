# Stage 1: Build dependencies
FROM python:3.13.3 as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir sentence-transformers
# Stage 2: Final image
# FROM python:3.13.3

# WORKDIR /app
# COPY --from=builder /app .

COPY . .

# Install gunicorn (if not in requirements.txt)
RUN pip install gunicorn

# CMD ["python", "app.py"]
CMD ["gunicorn", "chatbot_api.wsgi:application", "--bind", "0.0.0.0:8000"]
