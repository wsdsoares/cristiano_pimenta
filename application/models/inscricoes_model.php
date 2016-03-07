<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");

class inscricoes_Model extends CI_Model {
	
    public function do_insert($dados=NULL, $redir=TRUE){
        if ($dados != NULL):
            $this->db->insert('inscricoes', $dados);
           if ($this->db->affected_rows()>0):
                //auditoria('solicitacao requerimento', $dados);
                set_msg('msgok', '<div class="alert alert-success"><strong>Inscrição efetuada com sucesso!</strong>!</div>', 'erro');
            else:
                set_msg('msgerro', '<div class="alert alert-danger"><strong>Erro ao fazer a inscrição.<br/> Verifique suas informações e tente novamente.</strong>.</div>', 'erro');
            endif;
            if ($redir) redirect('painel');
			
        endif;
    }
        
	public function get_inscricoes($periodo=NULL){
		if ($periodo != NULL):	
			$this->db
				->order_by('data','asc')
				->where('periodo',$periodo);
			return $this->db->get('inscricoes');
		else:
			return FALSE;
		endif;
	}

	

	public function get_byid($id=NULL){
		if ($id != NULL):
			$this->db->where('idcategoria', $id);
			$this->db->limit(1);
			return $this->db->get('categoria');
		else:
			return FALSE;
		endif;
	}
		
}

/* End of file categoria_model.php */
/* Location: ./application/models/categoria_model.php */