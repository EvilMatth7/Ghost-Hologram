window_set_fullscreen(1920)

hsp = 0
vsp = 0 
zsp = 0

face = 1

z = 0

vel_max = 2
vel_pulo = 4.5
grav = .2



up = noone
down = noone
left = noone
right = noone
jump = noone
attack = noone



estado = noone

buffer_ataque = false

controla_player = function()
{

	up = keyboard_check(ord("W"))
	left = keyboard_check(ord("A"))
	right = keyboard_check(ord("D"))
	down = keyboard_check(ord("S"))
	jump = keyboard_check_pressed(ord("K"))
	
	attack = keyboard_check_pressed(ord("J"))

	hsp = (right - left) * vel_max
	vsp = (down - up) * vel_max
	

}

//Criando estados do player
estado_idle = function()
{
	sprite_index = spr_player_idle
	
	
	controla_player()
	
	//Saindo desse estado	
if (hsp != 0 or vsp != 0)
	{
		estado = estado_walk	
	}
	
if (jump)
	{
	estado = estado_pulo
	//dando velocidade do pulo
	zsp = -vel_pulo
	}
	
if (attack)
	{
	 estado = estado_ataque
	}
}

estado_walk = function()
{
	sprite_index = spr_player_andando
	
	
	controla_player()
	
	if (hsp == 0 && vsp == 0)
	{
		estado = estado_idle	
	}

	//indo para o estado de pulo
	if (jump)
	{
		estado = estado_pulo
	}
			
	if (attack)
	{
		estado = estado_ataque
	}

}

estado_ataque = function()
{
	hsp = 0
	vsp = 0
	var _attack = false
	
	if (buffer_ataque == true)
	{
		_attack = true	
	}
	else
	{
		buffer_ataque = keyboard_check_pressed(ord("J"))	
	}
	
	//resetando animação 
	if (sprite_index != spr_player_punch && sprite_index != spr_player_kick)
	{
		image_index = 0
	sprite_index = spr_player_punch
	}
	
	if (_attack && image_index >= image_number -1) 
	{
		// checando se estou socando
		if (sprite_index == spr_player_punch)
		{
				sprite_index = spr_player_kick
				image_index = 0
				buffer_ataque = false
		}
	}
	
	//saindo do estado
	if (image_index >= image_number-1)
	{
		estado = estado_idle	
		buffer_ataque = false 
	}
}

estado_pulo = function()
{
	
	if (sprite_index != spr_player_jump && zsp <= 0)
	{
		sprite_index = spr_player_jump
		image_index = 0
		zsp = -vel_pulo
	}
	
	
	
	controla_player()
	vsp *= .5
	if (image_index > image_number -1)
	{
		image_index = image_number -1
	}	
	
	
	aplica_gravidade(grav)
}


ajusta_fundo = function()
{
	// pegando a layer
	var _layer = layer_get_id("Background")
	
	//pegando a posição x e y da camera
	var _x = camera_get_view_x(view_camera[0])
	var _y = camera_get_view_y(view_camera[0])
	
	//ajustando a posição x do fundo
	layer_x(_layer, _x /2)
	layer_y(_layer,_y /2)
}



estado = estado_walk