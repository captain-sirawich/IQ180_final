/// @description Insert description here
// You can write your code in this editor
if (!selected){
	if point_in_rectangle(mouse_x, mouse_y, x-39, y-36, x + 32, y + 20){
		global.ANS[global.count] = global.numbers[4];
		global.count = global.count + 1;
		selected = true;
		audio_play_sound(click,0,0);
		//send numQ5
		/*buffer_seek(con_client.client_buffer,buffer_seek_start,0);
		buffer_write(con_client.client_buffer,buffer_u8,network.send_numQ5);
		buffer_write(con_client.client_buffer,buffer_u8,global.numbers[4]);
		network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
		//sending result
		
		buffer_seek(con_client.client_buffer,buffer_seek_start,0);
		buffer_write(con_client.client_buffer,buffer_u8,network.send_result);
		buffer_write(con_client.client_buffer,buffer_s16,global.RESULT);
		network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	*/
	}
	global.reset = false;
}