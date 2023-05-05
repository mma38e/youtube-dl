#!/bin/sh

echo "Making Downloads Folder"
mkdir -p /mnt/user/Music/downloads
downloads_folder="/mnt/user/Music/downloads"

echo "Please enter a playlist from youtube. Make sure the playlist is 'unlisted' "
read playlist

# sudo docker run --rm -it -v $downloads_folder:/music mma38e/youtube-dl:1.1 yt-dlp --extract-audio --audio-format mp3 --add-metadata -o "%(title)s.%(ext)s" $playlist
sudo docker run --rm -d -v $downloads_folder:/music mma38e/youtube-dl:1.1 yt-dlp --extract-audio --audio-format mp3 --add-metadata -o "%(title)s.%(ext)s" $playlist