# Use an official Python 3.9 slim version as the base image, which is a smaller image optimized for production
FROM python:3.9-slim

# Set the working directory inside the container to /app, where the application code will reside
WORKDIR /app/

# Copy the requirements.txt file from the host machine to the container's working directory
COPY book_catalog/requirements.txt .

# Install the required Python dependencies specified in requirements.txt using pip, without caching to reduce image size
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the source code from the 'book_catalog' directory on the host to the /app directory in the container
COPY book_catalog .

# Set the default command to run the application using Uvicorn, which is an ASGI server, 
# and specify the app to start (main:app) with the server running on host 0.0.0.0 and port 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
