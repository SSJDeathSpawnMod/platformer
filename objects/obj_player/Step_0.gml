/// @description Main Loop

vmov += grav

if(keyboard_check(ord("D"))) then dir = Direction.Right
else if(keyboard_check(ord("A"))) then dir = Direction.Left
else if(keyboard_check(ord("A")) && keyboard_check(ord("D"))) then dir = Direction.None
else dir = Direction.None

switch dir {
	case Direction.None:
		if(hmov != 0){
			if(hmov > 0) then hmov-= 2
			else if(hmov < 0) then hmov += 2
		}
		break
	case Direction.Right:
		if(hmov < 5) then hmov+=2
		break
	case Direction.Left:
		if(hmov > -5) then hmov-=2
		break
	default:
		show_error("Did you break the game?",true)
}

//Vertical Collision
if(place_meeting(x,y+vmov,obj_wall)) {
	while(!place_meeting(x,y+sign(vmov),obj_wall)) {
		y += sign(vmov)
	}
	vmov = 0
	if(keyboard_check_pressed(vk_space)) {
		vmov -= 8
	}
}

//Horizontal Collision
if(place_meeting(x+hmov,y,obj_wall)) {
	while(!place_meeting(x+sign(hmov),y,obj_wall)) {
		x += sign(hmov)
	}
	hmov = 0
}
x += hmov
y += vmov