#!/bin/bash

# brew install x265
# brew install ffmpeg
# brew install youtube-dl
# brew install imagemagick

ID='j3dxQdKdA_M' # YouTube video ID, i.e. https://www.youtube.com/watch?v={ID}
# convert the video file to GIF with ffmpeg
START='00:02:07.000' # start 4 seconds in
LENGTH='00:00:2.600' # end after 5 seconds
SIZE='1000x562' # size of the output GIF
START='00:00:24.000' # start 4 seconds in
LENGTH='00:00:7.000' # end after 5 seconds

# fetch the video file with youtube-dl
# convert it to MP4 (not really needed, but keeps the filename predictable)
if [ ! -f $ID.mp4 ]; then
  youtube-dl --no-check-certificate --output '%(id)s.%(ext)s' --recode-video mp4 $ID
fi



#ffmpeg -i $(youtube-dl --no-check-certificate -f 18 --get-url https://www.youtube.com/watch?v=$ID) -ss $START -t $LENGTH -c:v copy -c:a copy $ID.mp4

ffmpeg -ss $START -i $ID.mp4 -pix_fmt rgb8 -r 10 -s $SIZE -t $LENGTH $ID-unoptimized.gif
# optimize the GIF with imagemagick
convert -layers Optimize $ID-unoptimized.gif $ID.gif

# credits:
# http://www.commandlinefu.com/commands/view/10002/create-an-animated-gif-from-a-youtube-video
# http://superuser.com/a/436109/106809
