# This script is downloading the debian image for RaspberryPi and burning it
# to the given SD card. (see https://wiki.debian.org/RaspberryPiImages)

function usage() { echo $1; echo "Usage : sudo $0 SD_CARD_DEVICE"; exit 1; }

test $EUID -eq 0 || usage "Error : This script should be run as root"
test -z "$1" && usage "Error : Missing argument"

SD_CARD=$1
RPI_MODEL=3
DEBIAN_RELEASE=bullseye
IMG=raspi_${RPI_MODEL}_${DEBIAN_RELEASE}.img.xz
curl -LO https://raspi.debian.net/daily/${IMG}
curl -LO https://raspi.debian.net/daily/${IMG}.sha256
sha256sum -c ${IMG}.sha256
xzcat ${IMG} | dd of=${SD_CARD} bs=64k oflag=dsync status=progress
rm ${IMG}*
