# Prompt user for playlist URL
$playlistUrl = Read-Host "Enter the YouTube playlist URL"

# Create output folder
$downloadDir = Join-Path $PSScriptRoot "downloads"
New-Item -ItemType Directory -Force -Path $downloadDir | Out-Null

# yt-dlp output template:
# playlist_index: two-digit padded index
# title: video title
# ext: file extension (mp3)
$outputTemplate = "$downloadDir\%(playlist_index)s_%(title)s.%(ext)s"

# Build yt-dlp arguments
$ytDlpArgs = @(
    "-x",
    "--audio-format", "mp3",
    "--embed-metadata",
    "--embed-thumbnail",
    "--add-metadata",
    "--output", $outputTemplate,
    $playlistUrl
)

# Run yt-dlp
& yt-dlp @ytDlpArgs

Write-Host "`n✅ Download complete! MP3s saved to:`n$downloadDir"
Pause
