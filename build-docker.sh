#!/bin/bash

# Build the Docker image
docker build -t latex-resume .

# Run the container
# Maps the temp/build directory to get the output PDF
docker run --rm \
  -v "$(pwd)/temp/build:/resume/temp/build" \
  latex-resume

echo "Resume has been compiled. Check temp/build/resume.pdf" 