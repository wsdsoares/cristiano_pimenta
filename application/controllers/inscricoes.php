<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");

class inscricoes extends CI_Controller {
		
	public function __construct(){
		parent::__construct();
		init_painel();
		$this->load->model('Inscricoes_model', 'inscricoes');
                
	}
	public function index(){
        set_tema('conteudo', load_modulo('inscricoes', 'validar_declaracoes','painel'));
		load_template();
	}
	
	public function lista_inscritos(){
        set_tema('conteudo', load_modulo('inscricoes', 'lista_inscritos','painel'));
		load_template();
	}
	
	public function inscrever(){
		$this->form_validation->set_message('is_unique', 'Esta %s já está cadastrado no sistema');
		$this->form_validation->set_rules('matricula', 'MATRÍCULA', 'trim|rrequired|is_unique[inscricoes.matricula]');
		$this->form_validation->set_rules('nome', 'NOME', 'trim|equired|is_unique[inscricoes.nome]');
		$this->form_validation->set_rules('turma', 'TRUMA', 'required');
		
		setlocale( LC_ALL, 'pt_BR', 'pt_BR.iso-8859-1', 'pt_BR.utf-8', 'portuguese' );

	    date_default_timezone_set( 'America/Sao_Paulo' );
		
		
	    $dia = date( 'Y-m-d H:m:s' );
		if ($this->form_validation->run()==TRUE):
			$dados = elements(array('matricula', 'nome', 'turma'), $this->input->post());
			$dados['data'] = $dia;
			$validacao = $this->inscricoes->do_insert($dados);
			
			
			$this->inscricoes->do_insert('laboratorios',$dados);
		endif;
		set_tema('titulo', 'Validação');
		set_tema('conteudo', load_modulo('inscricoes', 'inscrever','painel'));
		load_template();
	}
        
        
}

/* End of file validacao_inscricoes.php */
/* Location: ./application/controllers/validacao_inscricoes.php */