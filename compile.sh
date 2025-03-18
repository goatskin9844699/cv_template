#!/bin/bash

# Parse command line arguments
DEBUG=false
while getopts "d" opt; do
  case $opt in
    d) DEBUG=true ;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
  esac
done

# Store the project root directory
PROJECT_ROOT=$(pwd)

# Create data directory if it doesn't exist
mkdir -p data

# Run xelatex with TEXINPUTS to include the src directory in the search path
TEXINPUTS="$PROJECT_ROOT/src/templates:$PROJECT_ROOT:" xelatex -output-directory=data resume.tex

# Run xelatex twice more
TEXINPUTS="$PROJECT_ROOT/src/templates:$PROJECT_ROOT:" xelatex -output-directory=data resume.tex
TEXINPUTS="$PROJECT_ROOT/src/templates:$PROJECT_ROOT:" xelatex -output-directory=data resume.tex

# Clean up temporary files unless in debug mode
if [ "$DEBUG" = false ]; then
    rm -f data/*.aux data/*.log data/*.out data/*.toc \
          data/*.lof data/*.lot data/*.bbl data/*.blg \
          data/*.nav data/*.snm
    echo "Temporary files cleaned up."
fi

echo "Compilation complete. Output is in data/resume.pdf" 