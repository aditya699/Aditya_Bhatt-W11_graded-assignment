# Use the Python 3.9 slim base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire 'Microservices' directory to the container's working directory
COPY Microservices/ /app/Microservices/

# Expose the port on which the Flask app will run (if needed)
EXPOSE 5000

# Command to run the Flask app when the container starts
CMD ["python", "Microservices/app.py"]

