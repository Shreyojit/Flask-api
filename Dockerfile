# Use the official Python image as a base
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Expose the Flask application port
EXPOSE 5000

# Set the environment variable to run Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Copy the start script and make it executable
COPY start.sh start.sh
RUN chmod +x start.sh

# Run the start script
CMD ["./start.sh"]
