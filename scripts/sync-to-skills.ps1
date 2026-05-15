param(
  [string]$RepoPath = 'C:\Users\zhangxincheng\.openclaw\workspace\repos\firmware-test-report',
  [string]$SkillPath = 'C:\Users\zhangxincheng\.openclaw\workspace\skills\firmware-test-report'
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $RepoPath)) {
  throw "RepoPath not found: $RepoPath"
}

if (-not (Test-Path $SkillPath)) {
  New-Item -ItemType Directory -Force -Path $SkillPath | Out-Null
}

Copy-Item "$RepoPath\SKILL.md" $SkillPath -Force

if (Test-Path "$RepoPath\README.md") {
  Copy-Item "$RepoPath\README.md" $SkillPath -Force
}

foreach ($dir in @('references', 'assets', 'scripts')) {
  $repoDir = Join-Path $RepoPath $dir
  $skillDir = Join-Path $SkillPath $dir

  if (Test-Path $repoDir) {
    Remove-Item $skillDir -Recurse -Force -ErrorAction SilentlyContinue
    Copy-Item $repoDir $SkillPath -Recurse -Force
  }
}

Write-Output "Synced firmware-test-report to skills directory."
Write-Output "Repo:  $RepoPath"
Write-Output "Skill: $SkillPath"
