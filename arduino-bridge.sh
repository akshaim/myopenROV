if [ -z $1 ]
then
	echo "Usage: ./arduino-bridge.sh [valueToSubmitToArduino] "
	exit
fi

/usr/bin/screen -S arduino -X stuff "$1"$'\n'
