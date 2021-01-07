@echo off
set root=replace with your path
CD /D %root%
MD cropped
MD processed 
magick mogrify -gravity center -crop 16:9 +repage -path cropped *.jpg
CD cropped
MD resized
magick mogrify -resize 1280x720 -gravity center -path resized *.jpg
CD resized
MD rotated
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 15 rotated\deg15_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 30 rotated\deg30_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 45 rotated\deg45_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 60 rotated\deg60_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 75 rotated\deg75_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 90 rotated\deg90_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 105 rotated\deg105_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 120 rotated\deg120_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 135 rotated\deg135_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 150 rotated\deg150_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 165 rotated\deg165_%%a
FOR %%a in (*.jpg) DO magick %%a -background black -rotate 180 rotated\deg180_%%a
CD rotated
magick mogrify -gravity center -background black -extent 1280x720 -crop 1280x720 *.jpg
PAUSE

