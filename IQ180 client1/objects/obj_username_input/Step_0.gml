/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_anykey) and string_length(global.text) <6	){
	global.text = global.text+string(keyboard_string);
	keyboard_string = "";
}

if(keyboard_check(vk_backspace) and keyboard_check_pressed(vk_backspace) and delete_timer = 1){
	global.text = string_delete(global.text,string_length(global.text),1);
	delete_timer = 0;
	keyboard_string = "";
}

if(keyboard_check_pressed(vk_backspace)){
	global.text = string_delete(global.text, string_length(global.text),1);
	keyboard_string = "";
	delete_timer = -4;
}

if(delete_timer != 2){
	delete_timer++;
}