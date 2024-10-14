# Get all .flv files recursively from the current directory
$flvFiles = Get-ChildItem -Recurse -Filter *.flv

# Loop through each .flv file
foreach ($flvFile in $flvFiles) {
    # Get the directory path where the current .flv file is located
    $directory = $flvFile.DirectoryName

    # Construct the full path for the new .mp4 file (keeping the same name)
    $mp4File = Join-Path $directory "$($flvFile.BaseName).mp4"

    # Construct the ffmpeg command for converting .flv to .mp4
    $ffmpegCommand = "ffmpeg -i `"$($flvFile.FullName)`" `"$mp4File`""

    # Output the command to see what is being executed (optional for debugging)
    Write-Host "Converting $($flvFile.FullName) to $mp4File..."

    # Run the ffmpeg command
    Invoke-Expression $ffmpegCommand

    # Optionally, you can remove the original .flv file after conversion if needed
    # Remove-Item $flvFile.FullName
}
