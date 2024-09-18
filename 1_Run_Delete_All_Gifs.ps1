# Get the current directory
$currentDirectory = Get-Location

# Get all GIF files in the current directory
$gifFiles = Get-ChildItem -Path $currentDirectory -Filter *.gif

# Loop through each GIF file and delete it
foreach ($file in $gifFiles) {
    Remove-Item $file.FullName -Force
    Write-Host "Deleted $($file.Name)"
}
