/// @description Insert description here
// You can write your code in this editor
var oY = -20; //Use this variable to set the offset above the sprite's origin
draw_set_color(c_white);
draw_text(x,y+oY,ceil(string(global.timer/room_speed)));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
