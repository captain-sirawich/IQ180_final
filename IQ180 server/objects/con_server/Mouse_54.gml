//show_message("reset1");


var _sock = ds_list_find_value(socket_list,0);
var _sock1 = ds_list_find_value(socket_list,1);
show_message(_sock);
buffer_seek(server_buffer,buffer_seek_start,0);
buffer_write(server_buffer,buffer_u8,network.game_reset);	
buffer_write(server_buffer,buffer_string,"server reset");
network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
//show_message("reset3");

show_message(_sock1);
buffer_seek(server_buffer,buffer_seek_start,0);
buffer_write(server_buffer,buffer_u8,network.game_reset);	
buffer_write(server_buffer,buffer_string,"server reset");
network_send_packet(_sock1,server_buffer,buffer_tell(server_buffer));
global.first = true;
{
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