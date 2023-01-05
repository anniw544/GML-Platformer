/// @desc core player logic

//Get player imputs

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calulate movement
var _move = key_right - key_left;

hsp = _move * walksp;

if (airjumpused=0)
{
vsp = vsp + grv;
}
if (airjumpused=1)
{
vsp=vsp+airjumpgrv
}
if (place_meeting(x,y+1,OBJ_InvisibleWall))
{
	airjumpused = 0
}

if (place_meeting(x,y+1,OBJ_InvisibleWall))  && (key_jump) 
{
	vsp = - jumpsp 
}

if (not place_meeting(x,y+1,OBJ_InvisibleWall)) && (key_jump) && (airjumpused=0)
{
	vsp = - airjumpsp
	airjumpused = 1
}

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

//Animation

if (!place_meeting(x,y+1,OBJ_InvisibleWall))
{
	sprite_index = SPR_SpaceMan_AirJump;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1
	if (hsp=0)
	{
		sprite_index = SPR_SpaceMan_Idle
	}
	else
	{
		sprite_index = SPR_SpaceMan_Walk
	}
}

if (hsp !=0) image_xscale = sign(hsp)