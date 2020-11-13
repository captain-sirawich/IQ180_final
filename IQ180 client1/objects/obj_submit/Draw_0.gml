/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_header);
if(selected){
	if(!global.correct){
		draw_set_color(c_red);
	} else{
		draw_set_color(c_green);
	}
} else{
	draw_set_color(c_black);
}
//draw_text(x, y, "SUBMIT");