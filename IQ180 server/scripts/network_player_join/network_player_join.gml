function network_player_join(){
	var _username = argument0;
	
	//create obj_server in server
	var _player = instance_create_depth(playerSpawn_x,playerSpawn_y,depth,obj_player);
	_player.username = _username; //give player a username
	#region //show player name
	var _sock = ds_list_find_value(socket_list,0);		
	if socket == _sock
	{
		var _player1 = instance_create_depth(x,y,depth,obj_player1);
	_player1.username = _username;
	}
	var _sock1 = ds_list_find_value(socket_list,1);
	if socket == _sock1
	{
		var _player2 = instance_create_depth(x,y,depth,obj_player2);
	_player2.username = _username;
	}
	#endregion
	#region number player connected
	if !instance_exists(obj_playcon)
	{
		var playcon = instance_create_depth(x,y,depth,obj_playcon);
		playcon.numcon = ds_list_size(socket_list);
		
	}else{
		instance_destroy(obj_playcon);
		var playcon = instance_create_depth(x,y,depth,obj_playcon);
		playcon.numcon = ds_list_size(socket_list);
	}
	#endregion
	//add instance id of obj_player to socket_map
	ds_map_add(socket_to_instanceid,socket,_player);
	
	#region //create obj_player for connecting client
	buffer_seek(server_buffer,buffer_seek_start,0);
	buffer_write(server_buffer,buffer_u8,network.player_connect);
	buffer_write(server_buffer,buffer_u8,socket);
	buffer_write(server_buffer,buffer_u16,_player.x);
	buffer_write(server_buffer,buffer_u16,_player.y);
	buffer_write(server_buffer,buffer_string,_player.username);
	network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
	#endregion
	
	#region //player who join know who already connected to server
	var i = 0;
	repeat(ds_list_size(socket_list))
	{
		var _sock = ds_list_find_value(socket_list,i);
		if _sock != socket
		{
			var _slave = ds_map_find_value(socket_to_instanceid,_sock);
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.player_joined);
			buffer_write(server_buffer,buffer_u8,_sock);
			buffer_write(server_buffer,buffer_u16,_slave.x);
			buffer_write(server_buffer,buffer_u16,_slave.y);
			buffer_write(server_buffer,buffer_string,_slave.username);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
		}
		i++;
	}
	#endregion
	
	#region //player know who join the server
	var i = 0;
	repeat(ds_list_size(socket_list))
	{
		var _sock = ds_list_find_value(socket_list,i);
		if _sock != socket
		{
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.player_joined);
			buffer_write(server_buffer,buffer_u8,socket);
			buffer_write(server_buffer,buffer_u16,_player.x);
			buffer_write(server_buffer,buffer_u16,_player.y);
			buffer_write(server_buffer,buffer_string,_player.username);
			network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
		}
		i++;
	}
	#endregion
}