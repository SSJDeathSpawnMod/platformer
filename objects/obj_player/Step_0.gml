/// @description Main Loop

if(!place_meeting(x,y+5,obj_wall)) {
	if(vmov < 10) {vmov += grav}
}
else {
	vmov = 0
}

if(keyboard_check(ord("D"))){
	dir = Direction.Right
}

if(keyboard_check(ord("A"))) {
	dir = Direction.Left
}

if(keyboard_check(ord("A")) && keyboard_check(ord("D"))) {
	dir = Direction.None
}



x+= hmov
y+= vmov