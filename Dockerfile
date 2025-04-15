FROM openjdk:11-slim

# Install Python manually
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set Python alias
RUN ln -s /usr/bin/python3 /usr/bin/python

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your project
COPY . .

# Run the app
CMD ["python", "crop_recommendation_pipeline.py"]
