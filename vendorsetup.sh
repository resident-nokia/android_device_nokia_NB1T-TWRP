#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2021 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="NB1"

export TW_DEVICE_VERSION=R11_1
export OF_TARGET_DEVICES="NB1"
export OF_VERSION=1.0
export OF_MAINTAINER="emufan4568"
export FOX_USE_TAR_BINARY=1
export FOX_USE_UNZIP_BINARY=1
export FOX_USE_NANO_EDITOR=1
export OF_AB_DEVICE=1
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

add_lunch_combo omni_"$FDEVICE"-eng
add_lunch_combo omni_"$FDEVICE"-userdebug