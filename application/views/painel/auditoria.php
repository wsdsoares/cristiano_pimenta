<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");
switch ($tela):
	 /********************************************************************************************************************************************
	*
	* Modificado por: Ricardo Maciel
	* email:analista.ti2015@gmail.com
	* modificação: 21-08-2015
	* funçao: Página inicial de gerenciamento de faltas
	* 	
	********************************************************************************************************************************************	
	*/
	case 'gerenciar':
		include_once('auditoria/gerenciar_auditoria.php');
	break;
	default:
		echo '<div class="alert-box alert"><p>A tela solicitada não existe</p></div>';
		break;
endswitch;