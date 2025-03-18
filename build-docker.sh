#!/bin/bash

# Build the Docker image
docker build -t latex-resume .

# Run the container
# Maps the data directory to get the output PDF
docker run --rm \
  -v "$(pwd)/data:/resume/data" \
  latex-resume

echo "Resume has been compiled. Check data/resume.pdf" 