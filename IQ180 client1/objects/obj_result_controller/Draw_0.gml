/// @description Insert description here
// You can write your code in this editor
if can_fade == 1 {
    draw_set_alpha(fade_timer/fade_timer_max);
    draw_set_color(c_black);
    draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview+view_hview[0],false);
    draw_set_alpha(1);
}