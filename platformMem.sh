#! /bin/bash
#
# Return the memory specs for Raspberry Pi model we are running
#

# Pull the CPU Model from /proc/cpuinfo
#modelName=$(grep 'model name' /proc/cpuinfo | sed 's/.*: //')
modelName=$(lscpu | grep -o ARM)
raspberryVer=""

if [[ ${modelName} == "ARM"* ]]; then
	# Pull the Board revision from /proc/cpuinfo
	boardRev=$(grep 'Revision' /proc/cpuinfo | awk '{print $3}' | sed 's/^100//')

	# Make the board revision human readable
	case $boardRev in
	*0002) raspberryVer="Model B Rev 1.0 (256MB)";;
	*0003) raspberryVer="Model B Rev 1.0 + ECN0001 (no fuses, D14 removed) (256MB)";;
	*0004) raspberryVer="Model B Rev 2.0 (256MB)";;
	*0005) raspberryVer="Model B Rev 2.0 (256MB)";;
	*0006) raspberryVer="Model B Rev 2.0 (256MB)";;
	*0007) raspberryVer="Model A Mounting holes (256MB)";;
	*0008) raspberryVer="Model A Mounting holes (256MB)";;
	*0009) raspberryVer="Model A Mounting holes (256MB)";;
	*000d) raspberryVer="Model B Rev 2.0 (512MB)";;
	*000e) raspberryVer="Model B Rev 2.0 (512MB)";;
	*000f) raspberryVer="Model B Rev 2.0 (512MB)";;
	*0010) raspberryVer="Model B+ Rev 1.0 (512MB)";;
	*0011) raspberryVer="CM1 Rev 1.0 (512MB)";;
	*0012) raspberryVer="Model A+ Rev 1.1 (256MB)";;
	*0013) raspberryVer="Model B+ Rev 1.2 (512MB)";;
	*0014) raspberryVer="CM1 Rev 1.0 (512MB)";;
	*0015) raspberryVer="Model A+ Rev 1.1";;
	*900021) raspberryVer="Model A+ Rev 1.1 (512MB) - Sony, UK";;
	*900032) raspberryVer="Model B+ Rev 1.2 (512MB) - Sony, UK";;
	*900092) raspberryVer="Pi Zero Rev 1.2 (512MB) - Sony, UK";;
	*900093) raspberryVer="Pi Zero Rev 1.3 (512MB) - Sony, UK";;
	*9000c1) raspberryVer="Pi Zero W Rev 1.1 (512MB) - Sony, UK";;
	*9020e0) raspberryVer="Pi 3 Model A+ Rev 1.0 (512MB) - Sony, UK";;
	*920092) raspberryVer="Pi Zero Rev 1.2 (512MB) - Embest";;
	*920093) raspberryVer="Pi Zero Rev 1.3 (512MB) - Embest";;
	*900061) raspberryVer="CM1 Rev 1.1 (512MB) - Sony, UK";;
	*a01040) raspberryVer="Pi 2 Model B Rev 1.0 (1GB) - Sony, UK";;
	*a01041) raspberryVer="Pi 2 Model B Rev 1.1 (1GB) - Sony, UK";;
	*a02042) raspberryVer="Pi 2 Model B Rev 1.2 (1GB) - Sony, UK";;
	*a02082) raspberryVer="Pi 3 Model B Rev 1.2 (1GB) - Sony, UK";;
	*a020a0) raspberryVer="CM3 Rev 1.0 (1GB) - Sony, UK";;
	*a020d3) raspberryVer="Pi 3 Model B+ Rev 1.3 (1GB) - Sony, UK";;
	*a020d4) raspberryVer='Pi 3 Model B+ Rev 1.4 (1GB) - Sony, UK';;
	*a21041) raspberryVer="Pi 2 Model B Rev 1.1 (1GB) - Embest, CH";;
	*a22042) raspberryVer="Pi 2 Model B Rev 1.2 (1GB) - Embest, CH";;
	*a22082) raspberryVer="Pi 3 Model B Rev 1.2 (1GB) - Embest, CH";;
	*a220a0) raspberryVer="CM3 Rev 1.0 (1GB) - Embest";;
	*a32082) raspberryVer="Pi 3 Model B Rev 1.2 (1GB) - Sony, JPN";;
	*a52082) raspberryVer="Pi 3 Model B Rev 1.2 (1GB) - Stadium";;
	*a22083) raspberryVer="Pi 3 Model B Rev 1.3 (1GB) - Embest";;
	*a02100) raspberryVer="CM3+ Rev 1.0 (1GB) - Sony, UK";;
	*a03111) raspberryVer="Pi 4 Model B Rev 1.1 (1GB) - Sony, UK";;
	*b03111) raspberryVer="Pi 4 Model B Rev 1.1 (2GB) - Sony, UK";;
	*b03112) raspberryVer="Pi 4 Model B Rev 1.2 (2GB) - Sony, UK";;
	*b03114) raspberryVer="Pi 4 Model B Rev 1.4 (2GB) - Sony, UK";;
	*c03111) raspberryVer="Pi 4 Model B Rev 1.1 (4GB) - Sony, UK";;
	*c03112) raspberryVer="Pi 4 Model B Rev 1.2 (4GB) - Sony, UK";;
	*c03114) raspberryVer="Pi 4 Model B Rev 1.4 (4GB) - Sony, UK";;
	*c03115) raspberryVer="Pi 4 Model B Rev 1.5 (4GB) - Sony, UK";;
	*d03114) raspberryVer="Pi 4 Model B Rev 1.4 (8GB) - Sony, UK";;
	*d03115) raspberryVer="Pi 4 Model B Rev 1.5 (4GB) - Sony, UK";;
	*c03130) raspberryVer="Pi 400 Rev 1.0 (4GB) - Sony, UK";;
	*a03140) raspberryVer="CM4 Rev 1.0 (1GB) - Sony, UK";;
	*b03140) raspberryVer="CM4 Rev 1.0 (2GB) - Sony, UK";;
	*c03140) raspberryVer="CM4 Rev 1.0 (4GB) - Sony, UK";;
	*d03140) raspberryVer="CM4 Rev 1.0 (8GB) - Sony, UK";;
	*902120) raspberryVer="Pi Zero 2 W Rev 1.0 (512MB) - Sony, UK";;
	*b04170) raspberryVer="Pi 5 Model B Rev 1.0 (2GB) - Sony, UK";;
	*c04170) raspberryVer="Pi 5 Model B Rev 1.0 (4GB) - Sony, UK";;
	*d04170) raspberryVer="Pi 5 Model B Rev 1.0 (8GB) - Sony, UK";;
	*) raspberryVer="Unknown ARM based System";;
	esac

	raspberryMem=$(echo $raspberryVer | sed -n 's/.*(\(.*\)).*/\1/p')
	echo $raspberryMem
fi