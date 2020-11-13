/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_header);
//draw_text(x,y,"Ready");
if(global.black_screen == true){
	draw_sprite_ext(spr_numq2, 0, 0, 0, 1, 1, 0, c_white, 1 );
}else {
	draw_sprite_ext(spr_numq2, 0, 0, 0, 1, 1, 0, c_white, 0 );
}