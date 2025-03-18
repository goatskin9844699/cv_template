# Development Rules

## LaTeX Development
- Use pdflatex for compilation
- Run compilation sequence: pdflatex → bibtex → pdflatex → pdflatex
- Keep auxiliary files in .gitignore
- Maintain clean working directory
- Use version control for content and style changes

## Project Structure
- Keep source files in `src/` directory:
  - Templates in `src/templates/`
  - Fonts in `src/fonts/`
  - Bibliography in `src/bibliography/`
- Store user content in `content/` directory
- Direct all generated files to `temp/` directory:
  - Build outputs in `temp/build/`
  - Auxiliary files in `temp/aux/`
- Never commit generated files (*.aux, *.log, *.pdf, etc.)
- Use compilation script for consistent builds

## Error Handling
- Check LaTeX logs for compilation errors
- Verify bibliography entries are properly formatted
- Ensure all required packages are available
- Validate cross-references and citations
- Check for proper font file inclusion

## Planning
Plan CV structure before writing by considering:
- Content organization and flow
- Section hierarchy
- Bibliography management
- Font and styling consistency
- Print vs. digital output
- ATS compatibility

## Technical Requirements
- LaTeX distribution (e.g., TeX Live)
- Required LaTeX packages
- Font files (Tex Gyre Heros, Lato)
- Bibliography management (BibTeX)
- PDF viewer for output 