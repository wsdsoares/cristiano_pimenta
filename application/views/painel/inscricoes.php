<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");
switch ($tela):
	case 'inscrever':
		include_once('itens_inscricoes/inscricoes.php');
	break;
	case 'lista_inscritos':
		include_once('itens_inscricoes/lista_inscritos.php');
	break;
	
	
	
endswitch;