/// @description Insert description here
// You can write your code in this editor
show_message(ds_list_size(socket_list));
if(ds_list_size(socket_list) == 2){
	var p1_time = ds_map_find_value(player_timer,1);
	var p2_time = ds_map_find_value(player_timer,2);
	var _sock1 = ds_list_find_value(socket_list,0);
	var _sock2 = ds_list_find_value(socket_list,1);

	if p1_time > p2_time
	{
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_result);
		buffer_write(server_buffer,buffer_string,"you win, you start first");
		buffer_write(server_buffer,buffer_string,"your turn");
		network_send_packet(_sock1,server_buffer,buffer_tell(server_buffer));

		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_result);
		buffer_write(server_buffer,buffer_string,"you lose, wait for your turn");
		buffer_write(server_buffer,buffer_string,"opponent's turn");
		network_send_packet(_sock2,server_buffer,buffer_tell(server_buffer));
	
	} 
	if p2_time > p1_time
	{
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_result);
		buffer_write(server_buffer,buffer_string,"you win, you start first");
		buffer_write(server_buffer,buffer_string,"your turn");
		network_send_packet(_sock2,server_buffer,buffer_tell(server_buffer));
	
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_result);
		buffer_write(server_buffer,buffer_string,"you lose, wait for your turn");
		buffer_write(server_buffer,buffer_string,"opponent's turn");
		network_send_packet(_sock1,server_buffer,buffer_tell(server_buffer));
	
	}
	if p2_time = p1_time
	{
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_tied);
		buffer_write(server_buffer,buffer_string,"tied");
		network_send_packet(_sock2,server_buffer,buffer_tell(server_buffer));
	
		buffer_seek(server_buffer,buffer_seek_start,0);
		buffer_write(server_buffer,buffer_u8,network.player_tied);
		buffer_write(server_buffer,buffer_string,"tied");
		network_send_packet(_sock1,server_buffer,buffer_tell(server_buffer));
		global.first = true;
	}
}
if ds_list_size(socket_list) == 1 {
	//show_message(" ส่ง")
	buffer_seek(server_buffer,buffer_seek_start,0);
	buffer_write(server_buffer,buffer_u8,network.player_single);
	buffer_write(server_buffer,buffer_string,"you answer is correct");
	buffer_write(server_buffer,buffer_string,"your turn");
	network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
}
/*buffer_seek(server_buffer,buffer_seek_start,0);
buffer_write(server_buffer,buffer_u8,network.send_score);
network_send_packet(_sock2,server_buffer,buffer_tell(server_buffer));

buffer_seek(server_buffer,buffer_seek_start,0);
buffer_write(server_buffer,buffer_u8,network.send_score);
network_send_packet(_sock1,server_buffer,buffer_tell(server_buffer));*/

//show_message(ds_map_size(player_timer));
ds_map_clear(player_timer);

/*if !ds_list_empty(socket_list)
    {
    var num = ds_list_size(socket_list);
	show_message(num);
    }
