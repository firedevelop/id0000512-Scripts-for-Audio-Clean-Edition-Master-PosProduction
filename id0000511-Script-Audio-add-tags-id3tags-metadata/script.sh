s#!/bin/sh

# NOTICE: this script is not working inside of a sync folder with Google File Stream. To fix this, simple move your folder to somewhere outside to Google File Stream.
# NOTICE: some cheaper devices can not read 48000hz or 32bit depth for that reason, I prefer convert to the standar 41000hz and 16bit depth
# NOTICE: I try to generate a wav file with 4100hz and 16bit depth and after convert to mp3 with 4100hz and 16bit depth, but in my case IS NOT POSSIBLE, the mp3 always take the value 32bit depth. For that reason don't convert the wav 32bit depth to 16bit depth is better conver directly the wav to mp3, and the mp3 will have 32 bit depth.

# INSTALL media-info to check the metadata and info files
# brew install media-info
# example command use:
# mediainfo audio.wav

# Get/set ID3 meta tags using ffmpeg:
# https://gist.github.com/eyecatchup/0757b3d8b989fe433979db2ea7d95a01
# https://superuser.com/questions/912730/ffmpeg-batch-convert-make-same-filename

# EXPLANATION COMMANDS:
# -y                                overriwrite files if exits.
# -ar 44100                         changes the frecuency to 44100Hz
# -af aformat=s16:44100             convert your audio wav in 16bit depth and 44100Hz
# -vn -ar 44100 -ac 2 -b:a 192k     convert audio mp3 to 44100hz and 192kbps
# -metadata TPE2="love"     this ID3tab metadata is in iTunes "Album artist" audio field


# TESTING COMMANDS:
#ffmpeg -i 003.wav -ar 44100 003-out.wav
# ffmpeg 003.wav -ar 44100 -sample_fmt s16 003-in.wav
# ffmpeg -y -i 003.wav -ar 44100 -sample_fmt s16 -metadata title="My title" -metadata artist="My Artist Name" -metadata album="My Album Name" -metadata TPE2="My Album Name" 003-out.mp3
# ffmpeg -y 003.wav -ar 44100 -sample_fmt s16 003-in.wav
# ffmpeg encoder=pcm_s16le 003.wav 003-out.wav
# ffmpeg -i 003.wav -vn -ar 44100 -ac 2 -b:a 192k  003-out.mp3
# ffmpeg -y -i 003.wav -af aformat=s16:44100 003-out.mp3
# ffmpeg -i input.mp3 -i cover.png -c copy -map 0 -map 1 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (Front)" out.mp3    // add cover
# ffmpeg -y -i 001.wav -af aformat=s16:44100 temp-001.wav; 
# ffmpeg -y -i temp-001.wav -b:a 192k -metadata album="My Album Name" -metadata track="$counterTrackNumber/$counterTotalFiles" -metadata title="${arr[$counterTrackNumber]}" -metadata artist="$metadataArtist" -metadata TPE2="$metadataTPE2" -metadata composer="$metadataComposer" -metadata genre="$metadataGenre" -metadata year="$metadataYear" 001.mp3
# ffmpeg -y -i 001.wav -af aformat=s16:44100 -vn -b:a 192k 001.mp3; 
# ffmpeg -i 001.wav -codec:a libmp3lame -qscale:a 2 001.mp3
# ffmpeg -y -i 001.mp3 -af aformat=s16:44100 temp-001.mp3; 
# ffmpeg -y -i 001.wav -vn -ar 44100 -b:a 128k -metadata album="My Album Name" -metadata track="$counterTrackNumber/$counterTotalFiles" -metadata title="${arr[$counterTrackNumber]}" -metadata artist="$metadataArtist" -metadata TPE2="$metadataTPE2" -metadata composer="$metadataComposer" -metadata genre="$metadataGenre" -metadata year="$metadataYear" 001-128.mp3
# ffmpeg -y -i 001.wav -af aformat=s16:44100 "001-128kbps-16bit-ffmpeg.mp3"; 
# ffmpeg -y -i 001.wav -af aformat=s32:44100 "32-44100-001.wav"; 
# ffmpeg -y -i 001.wav -ar 44100 "32-44100-001.wav"; 
  # for z in *.wav; do      
  #   ffmpeg -y -i $z -af aformat=s16:44100 "temp-$z";   
  #   let counterTrackNumber++
  #   ffmpeg -y -i "temp-$z" -vn -ar 44100 -ac 2 -b:a 192k -metadata album="My Album Name" -metadata track="$counterTrackNumber/$counterTotalFiles" -metadata title="${arr[$counterTrackNumber]}" -metadata artist="$metadataArtist" -metadata TPE2="$metadataTPE2" -metadata composer="$metadataComposer" -metadata genre="$metadataGenre" -metadata year="$metadataYear" $z.mp3
  # done



# SOFTWARE VERSION USED
# id3v2 -v
# id3v2 0.1.12
# Uses id3lib-3.8.3
#
# ffmpeg --version
# ffmpeg version 4.1.3
#
# mediainfo --version
# MediaInfoLib - v19.04


# TESTING SIZE MP3
# ffmpeg -y -i 001.wav -af aformat=s16:44100 "001-64kbps-32bit-using_ffmpeg.mp3";  
# ffmpeg -y -i 001.wav -af aformat=s16:44100 "001-16bit-using_ffmpeg.wav";  ffmpeg -y -i 001-16bit-using_ffmpeg.wav -b:a 128k 001-128kbps-32bit-using_ffmpeg.mp3;



# EXPLANATION MP3 EXPORT COMMAND
# https://stackoverflow.com/questions/3255674/convert-audio-files-to-mp3-using-ffmpeg
# ffmpeg -i input.wav -vn -ar 44100 -ac 2 -b:a 192k output.mp3
# Explanation of the used arguments in this example:
# -i - input file
# -vn - Disable video, to make sure no video (including album cover image) is included if the source would be a video file
# -ar - Set the audio sampling frequency. For output streams it is set by default to the frequency of the corresponding input stream. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options.
# -ac - Set the number of audio channels. For output streams it is set by default to the number of input audio channels. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options. So used here to make sure it is stereo (2 channels)
# -b:a - Converts the audio bitrate to be exact 192kbit per second
# convert all wav files to TO 44100hz - 16bits - 192kbps
# insert the ID3tags
# encode and export to mp3 audio format





#____________ 1. CONVERT ALL WAV FILES TO 44100hz and 16bits _______________________________
# Rename all audio wav files in folder, with the format 001.wav, 002.wav, 003.wav, etc...
a=1
for i in *.wav; do
  new=$(printf "%03d.wav" "$a") #03 pad to length of 3
  mv -i -- "$i" "$new"
  let a=a+1
done

rm *.mp3    # remove old mp3 files

declare -a arr=("" # always keep empty the first array index, because have index zero.
                "Track Title 1 (allow with special characters + $ ñ ò)"
                "Track Title 2 (allow with special characters + $ ñ ò)"
                "Track Title 3 (allow with special characters + $ ñ ò)"
                "Track Title 4 (allow with special characters + $ ñ ò)"
                "Track Title 5 (allow with special characters + $ ñ ò)"
                "Track Title 6 (allow with special characters + $ ñ ò)"
                "Track Title 7 (allow with special characters + $ ñ ò)"
                "Track Title 8 (allow with special characters + $ ñ ò)"
                "Track Title 9 (allow with special characters + $ ñ ò)"
                "Track Title 10 (allow with special characters + $ ñ ò)"
                "Track Title 11 (allow with special characters + $ ñ ò)"
                "Track Title 12 (allow with special characters + $ ñ ò)"
                )

counterTotalFiles = 0;    # count the total audio wav files there are in the folder
counterTrackNumber = 0;   # sequence of the track number
metadataArtist = "My Artist Name"
metadataTPE2="My Artist Album"
metadataComposer="My Composer"
metadataGenre="Spoken & Audio" 
metadataYear=`date +%Y`   # setup automatic the current year


# count the total audio wav files there are in the folder
for x in *.wav; do      
  let counterTotalFiles++
done

  for z in *.wav; do      
    let counterTrackNumber++
    ffmpeg -y -i "$z" -vn -ar 44100 -b:a 128k -metadata title="${arr[$counterTrackNumber]}" -metadata album="My Album Name" -metadata track="$counterTrackNumber/$counterTotalFiles" -metadata artist="$metadataArtist" -metadata TPE2="$metadataTPE2" -metadata composer="$metadataComposer" -metadata genre="$metadataGenre" -metadata year="$metadataYear" $z.mp3
  done

# remove temporaly files
rm "temp-"*.wav    
rm *.pkf    

# rename the wrong extension *.wav.mp3 to the right extension *.mp3
for f in *.mp3; do
    mv -- "$f" "$(basename -- "$f" .wav.mp3).mp3"
done


# show info about your media files generated
mediainfo *.mp3
ls -lah