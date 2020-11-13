/// @description Insert description here
// You can write your code in this editor
if point_in_rectangle(mouse_x, mouse_y, x, y, x +342, y + 120){
	audio_play_sound(click,0,0);
	if(global.correct){
		//global.point++;
		global.STOP = false;
		global.starttimer = false;
		global.status = false;
		//send timer
		//global.black_screen = true;
		buffer_seek(con_client.client_buffer,buffer_seek_start,0);
		buffer_write(con_client.client_buffer,buffer_u8,network.send_timer);
		buffer_write(con_client.client_buffer,buffer_f16,(global.timer/room_speed));
		buffer_write(con_client.client_buffer,buffer_u8,global.point);
		network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
		show_message(global.timer/room_speed);
		//room_goto(Result);
		//room_goto(Result);
	}
}
