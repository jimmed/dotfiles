#!/usr/bin/fish
for id in (xinput | grep 'multitouch sensor' | sed -e "s/^.\+id=//g" | sed -e "s/\s\+.\+\$//g")
	xinput map-to-output $id eDP1
end
