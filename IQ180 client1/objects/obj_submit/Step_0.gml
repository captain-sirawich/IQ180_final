/// @description Insert description here
// You can write your code in this editor
if point_in_rectangle(mouse_x, mouse_y, x, y, x + 150, y + 70){
	selected = true;
}else{
	selected = false;
}

if(global.timer == 0){
	global.STOP = false;
	//send timer
	//global.black_screen = true;
	buffer_seek(con_client.client_buffer,buffer_seek_start,0);
	buffer_write(con_client.client_buffer,buffer_u8,network.send_timer);
	buffer_write(con_client.client_buffer,buffer_f16,(global.timer/room_speed));
	network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
	show_message(global.timer/room_speed);
	global.status = false;
	global.timer = 60;
	global.starttimer = false;
}
	