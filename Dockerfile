# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the required files and directories into the container
COPY app.py /app/
COPY requirements.txt /app/
COPY ms /app/ms
COPY model /app/model

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 5000 (the default port used by Flask)
EXPOSE 5000

# Run Gunicorn to serve the Flask app
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000"]

