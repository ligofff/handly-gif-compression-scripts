# Get the current directory
$currentDirectory = Get-Location

# Path to gifsicle.exe in the current directory
$gifsiclePath = Join-Path -Path $currentDirectory -ChildPath "gifsicle.exe"

# Get all GIF files in the current directory
$gifFiles = Get-ChildItem -Path $currentDirectory -Filter *.gif

# Loop through each GIF file and compress it using lossy compression with Gifsicle
   foreach ($file in $gifFiles) {
       $inputFile = $file.FullName
       $outputFile = Join-Path -Path $currentDirectory -ChildPath ("new-" + $file.Name)
       
       # Compress the GIF file using lossy compression with Gifsicle from the current directory
       & $gifsiclePath "-O3" "--lossy=70" $inputFile "-o" $outputFile

       # Close the file handle
       $null = [System.IO.File]::OpenWrite($outputFile).Close()

       Write-Host "Lossy compressed $($file.Name) to $($outputFile)"
   }
   