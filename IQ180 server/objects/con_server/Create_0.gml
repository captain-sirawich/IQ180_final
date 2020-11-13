enum network
{
	player_establish,
	player_connect,
	player_joined,
	player_start,
	send_numQ1,
	send_numQ2,
	send_numQ3,
	send_numQ4,
	send_numQ5,
	send_result,
	send_timer,
	send_score,
	player_random,
	num_send,
	player_res,
	game_reset,
	random_numQ1,
	random_numQ2,
	random_numQ3,
	random_numQ4,
	random_numQ5,
	player_result,
	player_single,
	player_tied,
	player_disconnect,
	//move
}

port = 64198;
max_clients = 12;

network_create_server(network_socket_tcp,port,max_clients);

server_buffer = buffer_create(1024,buffer_fixed,1);
socket_list = ds_list_create();
random_list = ds_list_create();
socket_to_instanceid = ds_map_create();
player_timer = ds_map_create();
player_point = ds_map_create();

playerSpawn_x = 50;
playerSpawn_y = 100;
global.first = true;


