<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");

class Painel extends CI_Controller {
		
	public function __construct(){
		parent::__construct();
		init_painel();
	}

	public function index(){
		$this->inicio();
	}
	
	public function inicio(){
            set_tema('titulo', 'Início');
            set_tema('conteudo', load_modulo('inicio', 'inicio','painel'));
            load_template();
	}
	
}

/* End of file painel.php */
/* Location: ./application/controllers/painel.php */