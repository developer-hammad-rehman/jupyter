# Use the official Python 3.12 image as the base image
FROM python:3.12

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies for Jupyter
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook
RUN pip install --no-cache-dir jupyter

# Copy the contents of the ./notebook directory from your local machine into the container
COPY ./notebook /app/notebook

# Set the working directory to the copied notebook directory
WORKDIR /app/notebook

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]