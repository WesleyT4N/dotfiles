#!/usr/bin/bash

read -r running <<<"$(ps -ef | grep \"MacOS/Spotify\" | grep -v \"grep\" | wc -l)" &&
test $running != 0 &&
IFS='|' read -r theArtist theName theState theStream <<<"$(osascript <<<'if application "Spotify" is running then
  tell application "Spotify"
    if player state is playing then
      set theTrack to name of current track
      set theArtist to artist of current track
      set thePosition to player position
      return theArtist & " - " & "<span>" & theTrack
    else if player state is paused then
      set theTrack to name of current track
      set theArtist to artist of current track
      return theArtist & " - " & "<span>" & theTrack & "<span>" & " - paused"
    else
      return ""
    end if
  end tell
else
  return ""
end if')" &&
echo "$theArtist $theName"
