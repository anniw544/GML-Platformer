/// @desc core player logic

//Get player imputs

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calulate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

//horizontal collision

if (place_meeting(x+hsp,y,OBJ_InvisibleWall))
{
	while (!place_meeting(x+sign(hsp),y,OBJ_InvisibleWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//vertical collision

if (place_meeting(x,y+vsp,OBJ_InvisibleWall))
{
	while (!place_meeting(x,y+sign(vsp),OBJ_InvisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;