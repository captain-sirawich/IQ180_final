/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_header);
draw_set_color(c_white);
try{
	draw_text(x, y, global.ANS_RES);
} catch (ioException) {
}