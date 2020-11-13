/// @description Insert description here
// You can write your code in this editor
if point_in_rectangle(mouse_x, mouse_y, x, y, x + 1050, y + 130){
	audio_play_sound(click,0,0);
	if(selected == true and global.status == false){
		global.readycheck = true;
		global.status = true;
		buffer_seek(con_client.client_buffer,buffer_seek_start,0);
		buffer_write(con_client.client_buffer,buffer_u8,network.player_random);
		network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
		global.black_screen = true;
		if(global.message1 == "you win")
		{
			global.black_screen = false;
			global.message1 = "";
			show_message("Next Question");
		}
		//show_message(string(global.readycheck));
	}
}