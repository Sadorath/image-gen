$scriptDir = $PSScriptRoot
if (-not $scriptDir) { $scriptDir = (Get-Location).Path }

$manifestPath = Join-Path $scriptDir "manifest.json"

# Load existing manifest or initialize base structure
if (Test-Path $manifestPath) {
    $manifestJson = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json
    if (-not $manifestJson.assets) {
        $manifestJson | Add-Member -NotePropertyName "assets" -NotePropertyValue @() -Force
    }
} else {
    $manifestJson = [PSCustomObject]@{
        version = "1.0.0"
        assets  = @()
    }
}

# Map existing assets to preserve them
$assetMap = [ordered]@{}
foreach ($asset in $manifestJson.assets) {
    $assetMap[$asset.path] = $asset
}

# Find all SVG files recursively
$svgFiles = Get-ChildItem -Path $scriptDir -Filter "*.svg" -Recurse

$baseUri = [System.Uri](Join-Path $scriptDir "\")

foreach ($file in $svgFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    $type = $null
    $name = $null
    
    if ($content -match 'data-svg-type="([^"]+)"') { $type = $Matches[1] }
    if ($content -match 'data-svg-name="([^"]+)"') { $name = $Matches[1] }
    
    if ($type -and $name) {
        $fileUri = [System.Uri]$file.FullName
        $relativePath = [System.Uri]::UnescapeDataString($baseUri.MakeRelativeUri($fileUri).ToString()) -replace '\\', '/'
        
        $assetMap[$relativePath] = [PSCustomObject]@{
            type = $type
            name = $name
            path = $relativePath
        }
    } else {
        Write-Warning "Skipped $($file.Name): Missing data-svg-type or data-svg-name attributes."
    }
}

$manifestJson.assets = $assetMap.Values
$manifestJson | ConvertTo-Json -Depth 10 | Set-Content -Path $manifestPath -Encoding utf8

Write-Host "Manifest successfully updated at: $manifestPath" -ForegroundColor Green

# Keep the window open until Enter is pressed
Read-Host -Prompt "Press Enter to exit"