/// @description Insert description here
// You can write your code in this editor
timer--;
if (timer == 0) {
   can_fade =1 ;
}
if can_fade == 1 and global.turn == "Not your turn" {
    fade_timer += 1;
    if fade_timer >= fade_timer_max {
        fade_timer = 0;
        can_fade = 0;
		room_restart();
    }
}