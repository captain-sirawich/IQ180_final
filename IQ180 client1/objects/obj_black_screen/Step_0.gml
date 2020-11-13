/// @description Insert description here
// You can write your code in this editor
if(global.black_screen == true){
	draw_self();
}
if(global.turn == "your turn"){
	instance_destroy();
	global.black_screen = false;
}