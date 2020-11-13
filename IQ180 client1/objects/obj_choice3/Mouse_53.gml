/// @description Insert description here
// You can write your code in this editor
if point_in_rectangle(mouse_x, mouse_y, x, y, x + 160, y + 55){
		global.SYM[global.count_sym] = 2;
		global.count_sym = global.count_sym + 1;
		audio_play_sound(click,0,0);
}