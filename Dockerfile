FROM python:3.8-slim

WORKDIR /app

# Install system dependencies if any are needed (e.g. for build tools if required, but slim is usually fine for these packages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the Flask port
EXPOSE 5000

# Set environment variables
ENV PORT=5000
ENV FLASK_APP=application.py

# Run the Flask app
CMD ["python", "application.py"]
