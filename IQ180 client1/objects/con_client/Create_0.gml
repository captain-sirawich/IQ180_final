/// @description Insert description here
// You can write your code in this editor
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

}

client = network_create_socket(network_socket_tcp);
connected = network_connect(client,"192.168.1.43",64198);
if connected >= 0
	show_message("connected");


client_buffer = buffer_create(1024,buffer_fixed,1);

socket_to_instanceid = ds_map_create();
