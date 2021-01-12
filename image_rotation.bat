@echo off
set root=Replace this text with your path
CD /D %root%
set /a Index=1
setlocal enabledelayedexpansion
for /r %%i in (*.jpg) do ( 
    rename "%%i" "!Index!.jpg"
    set /a Index+=1
)
endlocal
MD Processed
magick mogrify -monitor -gravity center -crop 16:9 +repage -path Processed *.jpg
CD Processed
magick mogrify -monitor -resize 1280x720 -gravity center *.jpg
MD Rotated
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 15 Rotated\%%~na"_deg_15"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 30 Rotated\%%~na"_deg_30"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 45 Rotated\%%~na"_deg_45"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 60 Rotated\%%~na"_deg_60"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 75 Rotated\%%~na"_deg_75"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 90 Rotated\%%~na"_deg_90"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 105 Rotated\%%~na"_deg_105"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 120 Rotated\%%~na"_deg_120"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 135 Rotated\%%~na"_deg_135"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 150 Rotated\%%~na"_deg_150"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 165 Rotated\%%~na"_deg_165"%%~xa
FOR %%a in (*.jpg) DO magick %%a -monitor -background black -rotate 180 Rotated\%%~na"_deg_180"%%~xa
CD Rotated 
magick mogrify -monitor -gravity center -background black -extent 1280x720 -crop 1280x720 *.jpg
SET src_folder=%root%\Processed\Rotated
SET tar_folder=%root%\Processed
for /f %%a IN ('dir "%src_folder%" /b') do move "%src_folder%\%%a" "%tar_folder%\"
CD ..
rmdir Rotated
cls
echo Finished Processing - Please check the Processed folder
PAUSE
