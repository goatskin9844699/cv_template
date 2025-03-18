# LaTeX CV Template

A professional LaTeX CV template based on the Friggeri CV template, with custom modifications and improvements. Features a clean, modern design with customizable sections and formatting.

## Features

- Clean, modern design based on the Friggeri CV template
- Customizable sections with consistent formatting
- Professional skills section with categorized layout and subtle separators
- Responsive layout that works well both in print and digital formats
- ATS-friendly structure

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
└── compile.sh          # Compilation script
```

## Requirements

### LaTeX Distribution
- A modern LaTeX distribution (e.g., TeX Live 2021 or newer)
- XeLaTeX compiler (for font support)

### Required Packages
- geometry (page layout)
- xcolor (color support)
- tabularx (tables)
- enumitem (list customization)
- multicol (multiple columns)
- colortbl (table colors)
- lipsum (optional, for demo content)

## Usage

1. Edit your CV content in `content/resume.tex`
2. Compile using the provided script:
   ```bash
   ./compile.sh
   ```
   This will compile your CV and clean up temporary files automatically.

   For debugging, use the debug flag to preserve auxiliary files:
   ```bash
   ./compile.sh -d
   ```
   This will keep auxiliary files (`.log`, `.aux`, etc.) in the `temp/build/` directory.

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

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

Based on the Friggeri CV template with significant modifications and improvements. 