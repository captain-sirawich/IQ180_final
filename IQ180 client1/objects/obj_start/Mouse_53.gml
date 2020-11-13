/// @description Insert description here
// You can write your code in this editor
if (point_in_rectangle(mouse_x, mouse_y, x, y, x+350 , y + 130) && global.readycheck == true){
	audio_play_sound(click,0,0);
	buffer_seek(con_client.client_buffer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,network.num_send);
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	/*
	buffer_seek(con_client.client_buffer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,network.random_numQ1);
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	buffer_seek(con_client.client_buf5fer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,network.random_numQ2);
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	buffer_seek(con_client.client_buffer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,network.random_numQ3);
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	buffer_seek(con_client.client_buffer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,network.random_numQ4);
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	buffer_seek(con_client.client_buffer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,network.random_numQ5);
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	*/
	for (i = 0; i < array_length_1d(global.ANS); i++)
		global.ANS[i] = 0;
	for (i = 0; i < array_length_1d(global.SYM); i++)
		global.SYM[i] = "?";
		global.count = 0;
		global.count_sym = 0;
	if(global.reset == false){
		global.reset = true;
	}
	global.numbers[0] = 0;
	global.numbers[1] = 0;
	global.numbers[2] = 0;
	global.numbers[3] = 0;
	global.numbers[4] = 0;
	global.RESULT =0;
	global.readycheck = false;
	global.timer = room_speed * 60;
	global.STOP = true;
	global.starttimer = true;
	selected = true;
	draw_set_color(c_blue);
}