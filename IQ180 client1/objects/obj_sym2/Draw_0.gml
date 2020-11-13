/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_header);
draw_set_color(c_black);
switch(global.SYM2){
	case 0:
		draw_text(x, y, "+");
		break;
	case 1:
		draw_text(x, y, "x");
		break;
	case 2:
		draw_text(x, y, "-");
		break;
	case 3:
		draw_text(x, y, "/");
		break;
}