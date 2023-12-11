/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//estados do inimigo

estado_parado = function()
{
	sprite_index = spr_inimigo_idle
	
	hsp = 0
	vsp = 0
}

estado_walk = function()
{
	if (sprite_index != spr_inimigo_andando)
	{
		sprite_index = spr_inimigo_andando
		image_index = 0
	}	
}

estado_ataque = function()
{
	hsp = 0
	vsp = 0 
	if (sprite_index != spr_inimigo_ataque)
	{
	sprite_index = spr_inimigo_ataque
	}
}


estado = estado_parado()