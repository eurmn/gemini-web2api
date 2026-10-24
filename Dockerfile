FROM python:3.12-slim

WORKDIR /app

# Install httpx and any other requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the main script and optional defaults
COPY gemini_web2api.py ./
COPY config.example.json ./config.json

# Expose the port (assuming default 8081)
EXPOSE 8081

# Command to run the application with the cookie file
CMD ["python", "gemini_web2api.py", "--cookie-file", "cookie.txt"]
