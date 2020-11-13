function received_packet()
{
	buffer = argument0;
	socket = argument1;
	msgid = buffer_read(buffer,buffer_u8);
	
	switch(msgid)
	{
		case network.player_establish:
			var _username = buffer_read(buffer,buffer_string);
			global.username = _username;
			network_player_join(global.username);
			
			break;
		
				
		case network.send_timer:
			var timer = buffer_read(buffer,buffer_f16);
			var _sock = ds_list_find_value(socket_list,0);
			var _sock1 = ds_list_find_value(socket_list,1);
			//show_message(socket);
			//show_message(timer);
			if (socket == _sock && instance_exists(obj_timer))
					instance_destroy(obj_timer);
				
			if (socket == _sock1 && instance_exists(obj_timer1))
					instance_destroy(obj_timer1);
					
			if socket == _sock
			{
				var _playertimer = instance_create_depth(x+100,y,depth,obj_timer);
				_playertimer.timer = timer;
				ds_map_add(player_timer,socket,timer);
			}
				
			
			
			if socket == _sock1
			{
				var _playertimer1 = instance_create_depth(x+100,y+50,depth,obj_timer1);
				_playertimer1.timer = timer;
				ds_map_add(player_timer,socket,timer);
			}
			#region //คนนึงเล่นเสดบอกอีกคนให้เริ่มเล่น
			if (ds_map_size(player_timer) == 1 && ds_list_size(socket_list) == 2)
			{
				if socket == _sock
				{
					buffer_seek(server_buffer,buffer_seek_start,0);
					buffer_write(server_buffer,buffer_u8,network.player_start);
					buffer_write(server_buffer,buffer_string,"your turn");
					network_send_packet(_sock1,server_buffer,buffer_tell(server_buffer));
				}
				if socket == _sock1
				{
					buffer_seek(server_buffer,buffer_seek_start,0);
					buffer_write(server_buffer,buffer_u8,network.player_start);
					buffer_write(server_buffer,buffer_string,"your turn");
					network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				}
			}
			#endregion
						
			break;
			
			case network.send_score:
				var _score = buffer_read(buffer,buffer_u8);
				var _sock = ds_list_find_value(socket_list,0);
				var _sock1 = ds_list_find_value(socket_list,1);
				//show_message("socket " + string(socket));
				//show_message("score " + string(_score));
				if (socket == _sock && instance_exists(obj_score))
					instance_destroy(obj_score);
				
				if (socket == _sock1 && instance_exists(obj_score1))
					instance_destroy(obj_score1);
				
				if ds_list_size(socket_list) == 2{
					if socket == _sock
					{
					
						var _playertimer = instance_create_depth(x+200,y,depth,obj_score);
						_playertimer.timer = _score;
						ds_map_add(player_point,socket,_score);
						//show_message(string(socket) + "send" + string(_score) + "to" + string(_sock1));
						buffer_seek(server_buffer,buffer_seek_start,0);
						buffer_write(server_buffer,buffer_u8,network.send_score);
						buffer_write(server_buffer,buffer_u8,_score);
						network_send_packet(_sock1,server_buffer,buffer_tell(server_buffer));
						//show_message("sent");
					}
				
				
			
					if socket == _sock1
					{
						var _playertimer1 = instance_create_depth(x+200,y+50,depth,obj_score1);
						_playertimer1.timer = _score;
						//show_message(string(socket) + "send" + string(_score) + "to" + string(_sock));
						ds_map_add(player_point,socket,_score);
						buffer_seek(server_buffer,buffer_seek_start,0);
						buffer_write(server_buffer,buffer_u8,network.send_score);
						buffer_write(server_buffer,buffer_u8,_score);
						network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
						//show_message("sent");
					}
				}
				break;
				
			
			case network.player_random:
			#region
			{
				//sent 5 number
					randomize();
					global.NUM1 = round(random_range(1,9));
					global.NUM2 = round(random_range(1,9));
					global.NUM3 = round(random_range(1,9));
					global.NUM4 = round(random_range(1,9));
					global.NUM5 = round(random_range(1,9));
					global.numbers[0] = global.NUM1;
					global.numbers[1] = global.NUM2;
					global.numbers[2] = global.NUM3;
					global.numbers[3] = global.NUM4;
					global.numbers[4] = global.NUM5;
					for(count = 0; count < array_length_1d(global.numbers); count++) {
						var i = irandom_range(1, array_length_1d(global.numbers) - 1);
						var tmp = global.numbers[i];
						global.numbers[i] = global.numbers[0];
						global.numbers[0] = tmp;
					}
					
					
				
					
					if((global.NUM1>global.NUM2) && (global.NUM2!=0) && (global.NUM1%global.NUM2==0)){
						global.SYM1 = round(random_range(0,3));
					} else {
						global.SYM1 = round(random_range(0,2));
					}
					switch(global.SYM1){
						case 0:
							global.RESULT = global.NUM1 + global.NUM2;
							break;
						case 1:
							global.RESULT = global.NUM1 * global.NUM2;
							break;
						case 2:
							global.RESULT = global.NUM1 - global.NUM2;
							break;
						case 3:
							global.RESULT = global.NUM1 / global.NUM2;
							break;
					}
	
	
					if((global.RESULT>global.NUM3) && (global.NUM3!=0) && (global.RESULT%global.NUM3==0)){
						global.SYM2 = round(random_range(0,3));
					} else {
						global.SYM2 = round(random_range(0,2));
					}
					switch(global.SYM2){
						case 0:
							global.RESULT = global.RESULT + global.NUM3;
							break;
						case 1:
							global.RESULT = global.RESULT * global.NUM3;
							break;
						case 2:
							global.RESULT = global.RESULT - global.NUM3;
							break;
						case 3:
							global.RESULT = global.RESULT / global.NUM3;
							break;
					}
	
	
					if((global.RESULT>global.NUM4) && (global.NUM4!=0) && (global.RESULT%global.NUM4==0)){
						global.SYM3 = round(random_range(0,3));
					} else {
						global.SYM3 = round(random_range(0,2));
					}
					switch(global.SYM3){
						case 0:
							global.RESULT = global.RESULT + global.NUM4;
							break;
						case 1:
							global.RESULT = global.RESULT * global.NUM4;
							break;
						case 2:
							global.RESULT = global.RESULT - global.NUM4;
							break;
						case 3:
							global.RESULT = global.RESULT / global.NUM4;
							break;
					}
	
	
					if((global.RESULT>global.NUM5) && (global.NUM5!=0) && (global.RESULT%global.NUM5==0)){
						global.SYM4 = round(random_range(0,3));
					} else {
						global.SYM4 = round(random_range(0,2));
					}
					switch(global.SYM4){
						case 0:
							global.RESULT = global.RESULT + global.NUM5;
							break;
						case 1:
							global.RESULT = global.RESULT * global.NUM5;
							break;
						case 2:
							global.RESULT = global.RESULT - global.NUM5;
							break;
						case 3:
							global.RESULT = global.RESULT / global.NUM5;
							break;
					}
					global.ans = string(global.NUM1) + " " + string(global.NUM2) + " " + string(global.NUM3) + " " + string(global.NUM4) + " " + string(global.NUM5) + " = " + string(global.RESULT) + "\n" + string(global.SYM1) + " " + string(global.SYM2) + " " + string(global.SYM3) + " " + string(global.SYM4);
					
					
				
			}
			
			break;
			#endregion 
			case network.num_send:
			
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,network.player_random);
				buffer_write(server_buffer,buffer_u8,global.numbers[0]);
				buffer_write(server_buffer,buffer_u8,global.numbers[1]);
				buffer_write(server_buffer,buffer_u8,global.numbers[2]);
				buffer_write(server_buffer,buffer_u8,global.numbers[3]);
				buffer_write(server_buffer,buffer_u8,global.numbers[4]);
				buffer_write(server_buffer,buffer_s16,global.RESULT);
				network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			
			break;
		
		/*#region //random number and calculate result
		case network.random_numQ1:
		
			global.numQ1 = round(random_range(1,9));
			instance_create_depth(x+600,y+100,depth,obj_numQ1);
			
			
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.random_numQ1);
			buffer_write(server_buffer,buffer_u8,global.numQ1);
			buffer_write(server_buffer,buffer_u16,x+50);
			buffer_write(server_buffer,buffer_u16,y+100);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
		
			break;
			
		case network.random_numQ2:
		
			global.numQ2 = round(random_range(1,9));
			instance_create_depth(x+650,y+100,depth,obj_numQ2);
			
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.random_numQ2);
			buffer_write(server_buffer,buffer_u8,global.numQ2);
			buffer_write(server_buffer,buffer_u16,x+50);
			buffer_write(server_buffer,buffer_u16,y+100);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			
			break;
			
		case network.random_numQ3:
		
			global.numQ3 = round(random_range(1,9));
			instance_create_depth(x+700,y+100,depth,obj_numQ3);
			
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.random_numQ3);
			buffer_write(server_buffer,buffer_u8,global.numQ3);
			buffer_write(server_buffer,buffer_u16,x+50);
			buffer_write(server_buffer,buffer_u16,y+100);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			
			break;
			
		case network.random_numQ4:
		
			global.numQ4 = round(random_range(1,9));
			instance_create_depth(x+750,y+100,depth,obj_numQ4);
			
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.random_numQ4);
			buffer_write(server_buffer,buffer_u8,global.numQ4);
			buffer_write(server_buffer,buffer_u16,x+50);
			buffer_write(server_buffer,buffer_u16,y+100);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));
			
			break;
			
		case network.random_numQ5:
		
			global.numQ5 =  round(random_range(1,9));
			instance_create_depth(x+800,y+100,depth,obj_numQ5);
			
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.random_numQ5);
			buffer_write(server_buffer,buffer_u8,global.numQ5);
			buffer_write(server_buffer,buffer_u16,x+50);
			buffer_write(server_buffer,buffer_u16,y+100);
			network_send_packet(socket,server_buffer,buffer_tell(server_buffer));

			break;
			
		//case network.random_res:
		
		
			//break;
		#endregion	
		
	
		
					
			
			
		/*	
		case network.player_start:
			ds_list_shuffle(socket_list);
			var first_player = ds_list_find_value(socket_list,0);
			var second_player = ds_list_find_value(socket_list,1);
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.player_start);
			buffer_write(server_buffer,buffer_string,"your turn");
			network_send_packet(first_player,server_buffer,buffer_tell(server_buffer));
			
			buffer_seek(server_buffer,buffer_seek_start,0);
			buffer_write(server_buffer,buffer_u8,network.player_start);
			buffer_write(server_buffer,buffer_string,"Not your turn");
			network_send_packet(second_player,server_buffer,buffer_tell(server_buffer));
			 /*i = 0;
			 repeat(socket_list)
			 {
				var _sock = ds_list_find_value(socket_list,i);
				if _sock != first_player
				{
					buffer_seek(server_buffer,buffer_seek_start,0);
					buffer_write(server_buffer,buffer_u8,network.player_start);
					buffer_write(server_buffer,buffer_string,"wait for your turn");
					network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				}
				i++
			 }*/
			
			//break;
		
		/*case network.move:
			var move_x = buffer_read(buffer,buffer_u16);
			var move_y = buffer_read(buffer,buffer_u16);
			
			var _player = ds_map_find_value(socket_to_instanceid,socket);
			_player.x = move_x;
			_player.y = move_y;
			
			var i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,i);
				
				buffer_seek(server_buffer,buffer_seek_start,0);
				buffer_write(server_buffer,buffer_u8,network.move);
				buffer_write(server_buffer,buffer_u8,socket);
				buffer_write(server_buffer,buffer_u16,move_x);
				buffer_write(server_buffer,buffer_u16,move_y);
				network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
				i++;
			}
			break;*/
	}
}