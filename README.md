# Resume YAML to LaTeX

A Python tool to generate LaTeX resumes from YAML data. This tool allows you to maintain your resume data in a structured YAML format and convert it to a beautiful LaTeX document.

## Features

- Convert YAML resume data to LaTeX format
- Support for multiple LaTeX templates (currently includes Friggeri template)
- Docker support for easy deployment and consistent LaTeX compilation
- Command-line interface for easy use
- Python API for programmatic usage

## Project Structure

```
resume-yaml-to-latex/
├── data/                    # Input/output data directory
│   ├── resume.yaml         # Your resume data
│   ├── resume.tex          # Generated LaTeX file
│   └── resume.pdf          # Compiled PDF output
├── src/
│   └── resume_yaml_to_latex/
│       ├── __init__.py
│       ├── main.py         # CLI implementation
│       ├── models.py       # Data models
│       ├── parser.py       # YAML parser
│       └── templates/      # LaTeX templates
│           ├── base.py
│           └── friggeri.py
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── setup.py
└── README.md
```

## Using Docker (Recommended)

1. Build the Docker image:
   ```bash
   docker-compose build
   ```

2. Place your resume data in `data/resume.yaml`

3. Generate a resume:
   ```bash
   docker-compose run resume-generator
   ```

The generated LaTeX file will be available at `data/resume.tex`.

## Local Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/resume-yaml-to-latex.git
   cd resume-yaml-to-latex
   ```

2. Install the package:
   ```bash
   pip install -e .
   ```

## Command Line Interface

Generate a resume from YAML data:

```bash
# Using default files (data/resume.yaml -> data/resume.tex)
resume-yaml-to-latex

# Or specify custom input/output files
resume-yaml-to-latex path/to/resume.yaml path/to/output.tex
```

Options:
- `--template`: Specify the template to use (default: friggeri)

## Python API

```python
from resume_yaml_to_latex.parser import ResumeParser
from resume_yaml_to_latex.templates.friggeri import FriggeriTemplate

# Parse YAML data
resume = ResumeParser.parse("data/resume.yaml")

# Generate LaTeX
template = FriggeriTemplate()
template.set_resume(resume)
latex_content = template.generate()

# Save to file
with open("data/resume.tex", "w") as f:
    f.write(latex_content)
```

## YAML Format

Your resume data should be structured in YAML format as follows:

```yaml
basic_info:
  name: "Your Name"
  email: "your.email@example.com"
  phone: "+1 234 567 8900"
  location: "City, Country"
  website: "https://your-website.com"

objective: "A brief professional summary"

education:
  - school: "University Name"
    location: "City, Country"
    degree: "Degree Name"
    field: "Field of Study"
    start_date: "2020"
    end_date: "2024"
    gpa: "3.8"

experiences:
  - company: "Company Name"
    location: "City, Country"
    position: "Job Title"
    start_date: "2022"
    end_date: "Present"
    highlights:
      - "Achievement or responsibility"
      - "Another achievement or responsibility"

skills:
  - category: "Technical Skills"
    items:
      - "Skill 1"
      - "Skill 2"
  - category: "Soft Skills"
    items:
      - "Skill 1"
      - "Skill 2"
```

## Templates

### Friggeri Template

The Friggeri template is a modern, clean design that includes:
- Professional header with contact information
- Two-column layout
- Skills section with categorized items
- Experience timeline
- Education section
- Clean typography and spacing

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 