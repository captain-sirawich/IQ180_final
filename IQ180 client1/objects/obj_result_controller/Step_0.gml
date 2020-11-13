/// @description Insert description here
// You can write your code in this editor
timer--;
if (timer == 0) {
   can_fade =1 ;
}
if can_fade == 1 {
    fade_timer += 1;
    if fade_timer >= fade_timer_max {
        fade_timer = 0;
        can_fade = 0;
		global.STOP = false;
		global.starttimer = false;
        room_goto(Game_test);
    }
}