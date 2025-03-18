# Use Ubuntu as base image (LTS version for stability)
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install minimal TeX Live and required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-extra \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /resume

# Copy only necessary files
COPY src/templates ./src/templates
COPY src/fonts ./src/fonts
COPY content ./content
COPY compile.sh ./

RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-texgyre \
    fonts-font-awesome \
    && rm -rf /var/lib/apt/lists/*
 
# Set up fonts
RUN mkdir -p /usr/local/share/fonts/opentype/texgyreheros && \
    mkdir -p /usr/local/share/fonts/truetype/lato && \
    cp src/fonts/texgyreheros/*.otf /usr/local/share/fonts/opentype/texgyreheros/ && \
    cp src/fonts/lato/*.ttf /usr/local/share/fonts/truetype/lato/ && \
    fc-cache -f -v

# Make compile script executable
RUN chmod +x compile.sh

# Create temp directory for output
RUN mkdir -p temp/build

# Set default command
CMD ["./compile.sh"] 