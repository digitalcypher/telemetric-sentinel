# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY poetry.lock pyproject.toml /app/

# Install any needed packages specified in pyproject.toml and poetry.lock
RUN pip install poetry && poetry install --no-dev --no-root

# Copy the rest of the application's code into the container
COPY . /app/

# Run the application
CMD ["poetry", "run", "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8080"]
