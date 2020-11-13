function received_packet()
{
	buffer = argument0;
	msgid = buffer_read(buffer,buffer_u8);
	
	switch(msgid){
		
		case network.player_establish:
			var socket = buffer_read(buffer,buffer_u8);
			global.mysocket = socket;
			
			buffer_seek(client_buffer,buffer_seek_start,0);
			buffer_write(client_buffer,buffer_u8,network.player_establish);
			buffer_write(client_buffer,buffer_string,global.text);
			network_send_packet(client,client_buffer,buffer_tell(client_buffer));

			break;
			
			
		case network.player_connect:
			var _socket = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			var _username = buffer_read(buffer,buffer_string);
			
			var _player = instance_create_depth(_x,_y,depth,obj_player);
			_player.socket = _socket;
			_player.username = _username; //recv username
 			
			ds_map_add(socket_to_instanceid,_socket,_player);
			break;
			
		case network.player_joined:
			var _socket = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			var _username = buffer_read(buffer,buffer_string);
			
			var _slave = instance_create_depth(_x,_y,depth,obj_slave);
			_slave.socket = _socket;
			_slave.username = _username;
			
			
			ds_map_add(socket_to_instanceid,_socket,_slave);
			break;
	
		case network.player_start:
			global.turn = buffer_read(buffer,buffer_string);
			if global.turn == "your turn"
			{
				global.black_screen = false;
			}
			show_message(global.turn);
			
			break;
			
		
		/*case network.send_score:
						
			buffer_seek(con_client.client_buffer,buffer_seek_start,0);
			buffer_write(con_client.client_buffer,buffer_u8,network.send_score);
			buffer_write(con_client.client_buffer,buffer_u8,global.point);
			network_send_packet(con_client.client,con_client.client_buffer,buffer_tell(con_client.client_buffer));
			
			
		break;	*/
		case network.send_score:
			var _score = buffer_read(buffer,buffer_u8);
			//show_message("rcv");
			if instance_exists(obj_1)
				instance_destroy(obj_1);
			
			var _playertimer = instance_create_depth(x,y,depth,obj_1);
			_playertimer.timer = _score;
			//show_message("client1 show" + string(_score));
			
		
			break;
			
		case network.player_random:
		
			global.numbers[0] = buffer_read(buffer,buffer_u8);
			global.numbers[1] = buffer_read(buffer,buffer_u8);
			global.numbers[2] = buffer_read(buffer,buffer_u8);
			global.numbers[3] = buffer_read(buffer,buffer_u8);
			global.numbers[4] = buffer_read(buffer,buffer_u8);
			global.RESULT = buffer_read(buffer,buffer_s16);
			
			break;
			
		case network.game_reset:
			var result = buffer_read(buffer,buffer_string);
			show_message(result);
			
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
			global.point = 0;
			global.black_screen = true;
			global.starttimer = false
			global.readycheck = true;
			instance_destroy(obj_1);
		break;
		
		case network.player_result:
			var result = buffer_read(buffer,buffer_string);
			var result2 = buffer_read(buffer,buffer_string);
			if result == "you win, you start first"
			{
				global.point++;	
				global.message1 = "you win";
				global.black_screen = false;
			}
			show_message(result);
			
			if result2 == "your turn"
			{
				global.black_screen = false;
			}
			show_message(result2);
			buffer_seek(client_buffer,buffer_seek_start,0);
			buffer_write(client_buffer,buffer_u8,network.send_score);
			buffer_write(client_buffer,buffer_u8,global.point);
			network_send_packet(client,client_buffer,buffer_tell(client_buffer));
		
			break;
			
		case network.player_single:
			//show_message("รับ")
			var result = buffer_read(buffer,buffer_string);
			var result2 = buffer_read(buffer,buffer_string);
			if result == "you answer is correct"
			{
				global.point++;	
				global.message1 = "you win";
				global.black_screen = false;
			}
			show_message(result);
			
			if result2 == "your turn"
			{
				global.black_screen = false;
			}
			show_message(result2);
			buffer_seek(client_buffer,buffer_seek_start,0);
			buffer_write(client_buffer,buffer_u8,network.send_score);
			buffer_write(client_buffer,buffer_u8,global.point);
			network_send_packet(client,client_buffer,buffer_tell(client_buffer));
		
		break;
		
		
		case network.player_tied:
			global.tied = buffer_read(buffer,buffer_string);
			
			if global.tied == "tied"
			{
				global.black_screen = false;
			}
			show_message(global.tied);
			
			
		break;
		/*
		case network.random_numQ1:
			global.numQ[0] = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);

			var _numQ1 = instance_create_depth(_x,_y,depth,obj_con_numQ1);
			
			
			
		break;
			
/*
		case network.random_numQ2:
			global.numQ[1] = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
		
			var _numQ2 = instance_create_depth(_x,_y,depth,obj_con_numQ2);
				
			
		break;
		
				case network.random_numQ3:
			global.numQ[2]= buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			
			var _numQ3= instance_create_depth(_x,_y,depth,obj_con_numQ3);
			
			
		break;
		
		case network.random_numQ4:
			global.numQ[3]= buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			;
			var _numQ4= instance_create_depth(_x,_y,depth,obj_con_numQ4);
			
			
		break;
		
		case network.random_numQ5:
			global.numQ[4] = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
	
			var _numQ5= instance_create_depth(_x,_y,depth,obj_con_numQ5);
			
			
		break;
		
*/		
		
		case network.player_disconnect:
			var _socket = buffer_read(buffer,buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid,_socket);
			
			with(_player)
			{
				instance_destroy();	
			}
			
			ds_map_delete(socket_to_instanceid,_socket);
			break;
		/*
			buffer_seek(client_buffer,buffer_seek_start,0);
			buffer_write(client_buffer,buffer_u8,network.player_start);
			buffer_write(client_buffer,buffer_string,global.ready_int);
			network_send_packet(client,client_buffer,buffer_tell(client_buffer));
			
			*/
			
	}
	
	/*
	switch(msgid)
	{
		case network.player_establish:
			var _socket = buffer_read(buffer,buffer_u8);
			global.mysocket = _socket;
			
			buffer_seek(client_buffer,buffer_seek_start,0);
			buffer_write(client_buffer,buffer_u8,network.player_establish);
			buffer_write(client_buffer,buffer_string,con_game.username);
			network_send_packet(client,client_buffer,buffer_tell(client_buffer));

			break;
			
		case network.player_connect:
			var _socket = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			var _username = buffer_read(buffer,buffer_string);
			
			var _player = instance_create_depth(_x,_y,depth,obj_player);
			_player.socket = _socket;
			_player.username = _username;
			
			ds_map_add(socket_to_instanceid,_socket,_player);
			break;
			
		case network.player_joined:
			var _socket = buffer_read(buffer,buffer_u8);
			var _x = buffer_read(buffer,buffer_u16);
			var _y = buffer_read(buffer,buffer_u16);
			var _username = buffer_read(buffer,buffer_string);
			
			var _slave = instance_create_depth(_x,_y,depth,obj_slave);
			_slave.socket = _socket;
			_slave.username = _username;
			
			
			ds_map_add(socket_to_instanceid,_socket,_slave);
			break;
			
		case network.player_disconnect:
			var _socket = buffer_read(buffer,buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid,_socket);
			
			with(_player)
			{
				instance_destroy();	
			}
			
			ds_map_delete(socket_to_instanceid,_socket);
			break;
	
		case network.move:
			var _sock = buffer_read(buffer,buffer_u8);
			var move_x = buffer_read(buffer,buffer_u16);
			var move_y = buffer_read(buffer,buffer_u16);
			
			var _player = ds_map_find_value(socket_to_instanceid,_sock);
			
			_player.x = move_x;
			_player.y = move_y;
			
			break;
	}
	*/
}