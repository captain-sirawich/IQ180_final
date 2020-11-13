/// @description Insert description here
// You can write your code in this editor
global.ANS_RES = 0;
try{
switch(global.SYM[0]){
		case 0:
			global.ANS_RES = global.ANS[0] + global.ANS[1];
			break;
		case 1:
			global.ANS_RES = global.ANS[0] * global.ANS[1];
			break;
		case 2:
			global.ANS_RES = global.ANS[0] - global.ANS[1];
			break;
		case 3:
			global.ANS_RES = global.ANS[0] / global.ANS[1];
			break;
}
switch(global.SYM[1]){
		case 0:
			global.ANS_RES = global.ANS_RES + global.ANS[2];
			break;
		case 1:
			global.ANS_RES = global.ANS_RES * global.ANS[2];
			break;
		case 2:
			global.ANS_RES = global.ANS_RES - global.ANS[2];
			break;
		case 3:
			global.ANS_RES = global.ANS_RES / global.ANS[2];
			break;
}
switch(global.SYM[2]){
		case 0:
			global.ANS_RES = global.ANS_RES + global.ANS[3];
			break;
		case 1:
			global.ANS_RES = global.ANS_RES * global.ANS[3];
			break;
		case 2:
			global.ANS_RES = global.ANS_RES - global.ANS[3];
			break;
		case 3:
			global.ANS_RES = global.ANS_RES / global.ANS[3];
			break;
}
switch(global.SYM[3]){
		case 0:
			global.ANS_RES = global.ANS_RES + global.ANS[4];
			break;
		case 1:
			global.ANS_RES = global.ANS_RES * global.ANS[4];
			break;
		case 2:
			global.ANS_RES = global.ANS_RES - global.ANS[4];
			break;
		case 3:
			global.ANS_RES = global.ANS_RES / global.ANS[4];
			break;
}
} catch (ioException) {
}