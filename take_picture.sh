#!/bin/sh

while getopts "a" opt; do
	case $opt in
		a)
			ANIMATED=true
			;;
	esac
done

#VALORES POR DEFECTO
if [ -z "$ANIMATED" ]; then ANIMATED=false; fi

###########
#EXECUTION#
###########

OUTPUT_FILE_ANIMATED="output.gif"
OUTPUT_FILE="output.jpg"

take_animated()
{
	#take screenshots
	avconv \
		-f video4linux2 \
		-i /dev/video0 \
		-vf scale=320:-1 \
		-pix_fmt bgr8 \
		-vcodec gif \
		-r 10 \
		-t 4 \
		video%03d.jpg

	#convert screenshots to gif
	convert \
		-delay 10 \
		-loop 0 \
		video*.jpg \
		$OUTPUT_FILE_ANIMATED

	#remove screenshots
	rm -r video*.jpg
}

take_photo()
{
	fswebcam \
		-r 640x480 \
		--jpeg 80 \
		--no-banner \
		$OUTPUT_FILE
}

#make target dir
if "$ANIMATED"; then
	take_animated && echo $OUTPUT_FILE_ANIMATED && return 0
else
	take_photo && echo $OUTPUT_FILE && return 0
fi

return 1
