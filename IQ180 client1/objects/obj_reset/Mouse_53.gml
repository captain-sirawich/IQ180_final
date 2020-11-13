/// @description Insert description here
// You can write your code in this editor
if point_in_rectangle(mouse_x, mouse_y, x, y, x + 70, y + 70){
	for (i = 0; i < array_length_1d(global.ANS); i++)
		global.ANS[i] = 0;
	for (i = 0; i < array_length_1d(global.SYM); i++)
		global.SYM[i] = "?";
	global.count = 0;
	global.count_sym = 0;
	if(global.reset == false){
		global.reset = true;
	}
}