param(
  [Parameter(Mandatory=$true)][string]$Name,
  [string]$Org="Deecon",
  [string]$Root="C:\Dev",
  [switch]$LocalVenv  # use <repo>\.venv instead of named conda env
)

$Template = "C:\Dev\_templates\py-conda-vscode"
$Dest = Join-Path $Root (Join-Path $Org $Name)
$EnvName = (($Name -replace '[^A-Za-z0-9_-]','-') + "_env") -replace '-+','-'

New-Item -ItemType Directory -Force $Dest | Out-Null
Copy-Item -Recurse -Force "$Template\*" $Dest

(Get-Content "$Dest\environment.yml") -replace "__ENV_NAME__", $EnvName | Set-Content "$Dest\environment.yml"
(Get-Content "$Dest\README.md") -replace "__PROJECT_NAME__", $Name -replace "__ENV_NAME__", $EnvName | Set-Content "$Dest\README.md"
(Get-Content "$Dest\src\main.py") -replace "__PROJECT_NAME__", $Name | Set-Content "$Dest\src\main.py"

Push-Location $Dest
git init
git checkout -b main
git add .
git commit -m "chore: scaffold"

if ($LocalVenv) {
  conda create -p .\.venv -y python=3.13
  conda install -p .\.venv -y pandas openpyxl python-docx ruff mypy pytest pre-commit
  Write-Host "`nLocal env created at .\.venv  -> In VS Code, select ${PWD}\.venv\python.exe"
} else {
  conda env create -f environment.yml
  Write-Host "`nNamed env created: $EnvName"
}

Write-Host "`nNext:"
Write-Host "  conda activate $EnvName    # or: conda activate .\.venv"
Write-Host "  pre-commit install"
Write-Host "  code $Dest"
Pop-Location
