# Code Style Rules

## LaTeX Conventions
- Use descriptive section names in \section{} commands
- Keep \begin{} and \end{} pairs aligned for readability
- Use consistent indentation (2 spaces) for nested environments
- Group related commands together
- Use meaningful variable names in \newcommand definitions

## Clean Code Principles
- Keep environments and commands focused and modular
- Follow DRY (Don't Repeat Yourself) principle
- Write clean, readable, and maintainable LaTeX code
- Use \newcommand for repeated patterns
- Keep style definitions in the class file

## Document Structure
- Organize content into logical sections
- Use consistent spacing between sections
- Keep bibliography entries well-formatted
- Maintain clear separation between content and styling
- Use appropriate LaTeX environments for different content types

## File Organization
- Keep template files (.cls) in src/templates/
- Store font files in src/fonts/ with subdirectories per font family
- Place bibliography files in src/bibliography/
- Keep user content separate in content/
- Direct all generated files to temp/ directory

## Font and Typography
- Use consistent font families throughout
- Maintain proper font size hierarchy
- Follow typographic best practices for CVs
- Use appropriate font weights for emphasis
- Keep font files organized by family

## Naming Conventions
- Use single quotes for strings
- Start private class variables with an underscore
- Use UPPER_SNAKE_CASE for constants
- Always write "MongoDB" (not "Mongo")
- Keep variables and function names descriptive

## Function Design
- Keep functions small and focused on a single responsibility
- Use async functions by default unless dealing with simple synchronous operations
- Pass dependencies to classes during initialization 