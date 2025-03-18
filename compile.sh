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

# Create output directory if it doesn't exist
mkdir -p temp/build

# Change to the content directory
cd content

# Run xelatex with TEXINPUTS to include the src directory in the search path
TEXINPUTS="$PROJECT_ROOT/src/templates:$PROJECT_ROOT:" xelatex -output-directory=../temp/build resume.tex

# Run xelatex twice more
TEXINPUTS="$PROJECT_ROOT/src/templates:$PROJECT_ROOT:" xelatex -output-directory=../temp/build resume.tex
TEXINPUTS="$PROJECT_ROOT/src/templates:$PROJECT_ROOT:" xelatex -output-directory=../temp/build resume.tex

# Go back to project root
cd ..

# Clean up temporary files unless in debug mode
if [ "$DEBUG" = false ]; then
    rm -f temp/build/*.aux temp/build/*.log temp/build/*.out temp/build/*.toc \
          temp/build/*.lof temp/build/*.lot temp/build/*.bbl temp/build/*.blg \
          temp/build/*.nav temp/build/*.snm
    echo "Temporary files cleaned up."
fi

echo "Compilation complete. Output is in temp/build/resume.pdf" 