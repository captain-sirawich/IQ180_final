//show_message(ds_list_size(socket_list));
//show_message(string(ds_list_find_value(socket_list,0))+" ก่อนสุ่ม");
ds_list_copy(random_list,socket_list);
if (global.first && ds_list_size(socket_list) == 2)
{
	if ds_list_size(random_list) == 2 
	{
		ds_list_shuffle(random_list);
		//show_message(string(ds_list_find_value(random_list,0))+" หลังสุ่ม");
		var first_player = ds_list_find_value(random_list,0);
		var second_player = ds_list_find_value(random_list,1);
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_start);
		buffer_write(server_buffer,buffer_string,"your turn");
		network_send_packet(first_player,server_buffer,buffer_tell(server_buffer));
	
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_start);
		buffer_write(server_buffer,buffer_string,"opponent's turn");
		network_send_packet(second_player,server_buffer,buffer_tell(server_buffer));
	}
	global.first = false;
}

if (global.first && ds_list_size(socket_list) == 1)
{
	if ds_list_size(random_list) == 1 
	{
		ds_list_shuffle(random_list);
		//show_message(string(ds_list_find_value(random_list,0))+" หลังสุ่ม");
		var first_player = ds_list_find_value(random_list,0);
		//var second_player = ds_list_find_value(random_list,1);
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_start);
		buffer_write(server_buffer,buffer_string,"your turn");
		network_send_packet(first_player,server_buffer,buffer_tell(server_buffer));
	
		//buffer_seek(server_buffer,buffer_seek_start,0);
		//buffer_write(server_buffer,buffer_u8,network.player_start);
		//buffer_write(server_buffer,buffer_string,"opponent's turn");
		//network_send_packet(second_player,server_buffer,buffer_tell(server_buffer));
	}
	
}