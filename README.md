# Python Project Templates

A collection of project templates and tools for quickly scaffolding Python projects with Conda environments and VS Code configuration.

## Quick Start

Create a new Python project using PowerShell:

```powershell
.\scripts\New-PyProj.ps1 -Name "MyProject"
```

This will:
1. Create project at `C:\Dev\Deecon\MyProject`
2. Set up a Conda environment named `MyProject_env`
3. Initialize git repository
4. Configure VS Code settings

## Usage Options

### Basic Usage (Named Conda Environment)
```powershell
.\scripts\New-PyProj.ps1 -Name "DataAnalysis"
```

### Local Virtual Environment
```powershell
.\scripts\New-PyProj.ps1 -Name "DataAnalysis" -LocalVenv
```

### Custom Organization and Location
```powershell
.\scripts\New-PyProj.ps1 -Name "DataAnalysis" -Org "ClientA" -Root "D:\Projects"
```

## Parameters

- `-Name` (Required): Project name
- `-Org` (Optional): Organization folder name (default: "Deecon")
- `-Root` (Optional): Root directory (default: "C:\Dev")
- `-LocalVenv` (Switch): Use local `.venv` instead of named Conda environment

## Template Structure

```
py-conda-vscode/
├── .gitignore         # Pre-configured git ignore rules
├── environment.yml    # Conda environment specification
├── .vscode/          
│   └── settings.json  # VS Code Python settings
└── src/
    └── main.py       # Project entry point
```

## Post-Creation Steps

After creating your project:

1. Navigate to project directory
2. Activate the environment:
   ```bash
   # For named environment:
   conda activate <project-name>_env
   
   # For local environment:
   conda activate .\.venv
   ```
3. Install pre-commit hooks:
   ```bash
   pre-commit install
   ```
4. Open in VS Code:
   ```bash
   code .
   ```

## Included Tools

- pandas
- openpyxl
- python-docx
- ruff (linting)
- mypy (type checking)
- pytest (testing)
- pre-commit
