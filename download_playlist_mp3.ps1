# Asking for playlist URL
$playlistUrl = Read-Host "Enter YouTube playlist URL"

# Creating output folder
$downloadDir = Join-Path $PSScriptRoot "downloads"
New-Item -ItemType Directory -Force -Path $downloadDir | Out-Null

# audio number + title of the video + mp3
$outputTemplate = "$downloadDir\%(playlist_index)s_%(title)s.%(ext)s"

# add for metadata
$ytDlpArgs = @(
    "-x",
    "--audio-format", "mp3",
    "--embed-metadata",
    "--embed-thumbnail",
    "--add-metadata",
    "--output", $outputTemplate,
    $playlistUrl
)

# Running yt-dlp with arguments
& yt-dlp @ytDlpArgs

Write-Host "`n Download completed! files saved to:`n$downloadDir"
Pause
