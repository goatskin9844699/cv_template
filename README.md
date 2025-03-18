# LaTeX CV Template

A professional LaTeX CV template based on the Friggeri CV template, with custom modifications and improvements. Features a clean, modern design with customizable sections and formatting.

## Quick Start

### Using Docker (Recommended)
```bash
# Clone the repository
git clone https://github.com/yourusername/resume_latex_template.git
cd resume_latex_template

# Edit your resume content
edit content/resume.tex

# Build using Docker (no LaTeX installation required)
./build-docker.sh
```
Your compiled resume will be available at `temp/build/resume.pdf`

### Using Local LaTeX Installation
```bash
# Clone the repository
git clone https://github.com/yourusername/resume_latex_template.git
cd resume_latex_template

# Edit your resume content
edit content/resume.tex

# Compile using the script
./compile.sh
```

## Features

- Clean, modern design based on the Friggeri CV template
- Customizable sections with consistent formatting
- Professional skills section with categorized layout and subtle separators
- Responsive layout that works well both in print and digital formats
- ATS-friendly structure
- Docker support for easy compilation without local LaTeX installation

## Requirements

### Option 1: Using Docker (Recommended)
- Docker installed on your system
- No other dependencies needed

### Option 2: Local LaTeX Installation
#### LaTeX Distribution
- A modern LaTeX distribution (e.g., TeX Live 2021 or newer)
- XeLaTeX compiler (for font support)

#### Required Packages
- geometry (page layout)
- xcolor (color support)
- tabularx (tables)
- enumitem (list customization)
- multicol (multiple columns)
- colortbl (table colors)
- lipsum (optional, for demo content)

## Project Structure

```
resume_latex_template/
├── src/                    # Source files
│   ├── templates/         # Template files
│   │   └── friggeri-cv.cls
│   └── fonts/            # Font files
│       ├── texgyreheros/
│       └── lato/
├── content/              # User content
│   └── resume.tex       # Main resume content file
├── temp/                # Generated files (gitignored)
│   ├── build/          # Compilation output
│   └── aux/            # Auxiliary files
├── Dockerfile          # Docker configuration
├── build-docker.sh     # Docker build script
└── compile.sh          # Local compilation script
```

## Usage

### Docker Method
1. Make sure Docker is installed on your system
2. Edit your CV content in `content/resume.tex`
3. Run the Docker build script:
   ```bash
   ./build-docker.sh
   ```
4. Find your compiled PDF in `temp/build/resume.pdf`

### Local Installation Method
1. Edit your CV content in `content/resume.tex`
2. Compile using the provided script:
   ```bash
   ./compile.sh
   ```
   For debugging, use the debug flag to preserve auxiliary files:
   ```bash
   ./compile.sh -d
   ```
3. Find your compiled PDF in `temp/build/resume.pdf`

## Customization

### Skills Section
The template includes a customized skills section with:
- Bold category headers
- Light grey separator lines between categories
- Consistent spacing and indentation
- Example usage:
```latex
\begin{skills}
\category{Languages}Python, Java, C++
\skillsep
\category{Frameworks}Django, Spring, Qt
\end{skills}
```

### Template Styles
- Main template styles are defined in `src/templates/friggeri-cv.cls`
- Colors can be customized in the template file
- Section spacing and formatting can be adjusted in the class file

### Fonts
- Default fonts are included in `src/fonts/`
- Font configurations can be modified in the template file

## Troubleshooting

### Font Issues
If you're using the local installation method and encounter font-related errors:

1. Make sure the fonts are properly installed in your system:
   ```bash
   # For Linux systems
   sudo mkdir -p /usr/share/fonts/truetype/texgyreheros
   sudo mkdir -p /usr/share/fonts/truetype/lato
   sudo cp src/fonts/texgyreheros/*.otf /usr/share/fonts/truetype/texgyreheros/
   sudo cp src/fonts/lato/*.ttf /usr/share/fonts/truetype/lato/
   sudo fc-cache -f -v
   ```

2. If you're still having issues, try using the Docker method instead, which handles font installation automatically.

### Common Issues
- If you see "font cannot be found" errors, make sure you're either using Docker (recommended) or have installed the fonts as described above.
- For other LaTeX-related errors when using local installation, make sure all required packages are installed through your TeX distribution.

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

Based on the Friggeri CV template with significant modifications and improvements. 