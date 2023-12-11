/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();


//seguir o player
var _alvo = instance_find(obj_player, 0)
var _dist = point_distance(x, y, obj_player.x, obj_player.y)



//if (_alvo != noone)
//{
//	hsp = 1

//	estado = estado_walk()
	
//	//move_towards_point(obj_player.x + 100, obj_player.y, vel_max)
		
//	if (distance_to_object(obj_player) < 0.5)
//	{
//	estado = estado_parado()
//	}
//	else estado = estado_walk()
//}
//if (obj_player. x < x)
//{
//	face = 1
//}
//else 
//{
// face = -1
//}	

//verificar se tem um alvo
if(_alvo != noone)
{
	estado = estado_walk();
	//verficar lado em que o alvo está	
		//mover em direção ao alvo até um limite
		if(_dist > 25)
		{	
			if(_alvo.x < x)
			{				
				face = -1
				hsp = 1
				x -= hsp
			}
			else
			{
				face = 1
				hsp = 1
				x += hsp
			}	
				
		
		}
}
//parar de seguir
_alvo = noone;

if _dist < 30
{
	instance_destroy()	
}