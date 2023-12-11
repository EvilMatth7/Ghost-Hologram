  // Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcoes(){

}

function aplica_gravidade(_grav = .2)
{
	//Ele vai mudar o eixo z
	z += zsp
	
	//Aplicando a gravidade se eu não estou no chão 
	if (z < 0)
	{
		zsp += _grav
	}
	else 
	{
		zsp = 0	
		z = 0
		estado = estado_idle
	}		
}
