<?php
if (!defined("BASEPATH"))
	exit("No direct script access allowed");

class Usuarios_model extends CI_Model {

	public function do_insert($dados = NULL, $redir = TRUE) {
		if ($dados != NULL) :
			$this -> db -> insert('usuario', $dados);
			if ($this -> db -> affected_rows() > 0) :
				//auditoria('Inclusão de usuários', 'Usuário "'.$dados['login'].'" cadastrado no sistema');
				set_msg('msgok', '<div class="alert alert-success"><strong>Cadastro efetuado com sucesso</strong>!</div>', 'sucesso');
			else :
				set_msg('msgerro', '<div class="alert alert-danger"><strong>Erro ao inserir dados</strong>.</div>', 'sucesso');
			endif;
			if ($redir)
				redirect(current_url());
		endif;
	}

	public function do_update($dados = NULL, $condicao = NULL) {//, $redir=TRUE
		if ($dados != NULL && $condicao != NULL) ://is_array($condicao!=NULL)
			$this -> db -> update('usuario', $dados, $condicao);
			if ($this -> db -> affected_rows() > 0) :
				//auditoria('Alteração de usuários', 'Alterado cadastro do usuário "'.$usuario.'"');
				set_msg('msgok', '<div class="alert alert-success"><strong>Alteração efetuada com sucesso!</strong> &nbsp Uma nova senha foi enviada para o seu e-mail.</div>', 'sucesso');
			else :
				set_msg('msgerro', '<div class="alert alert-danger"><strong>Erro ao atualizar dados</strong>.</div>', 'sucesso');
			endif;
			redirect(current_url());
		/*$usuario = $this->usuario->get_byid($condicao['codusuario'])->row()->login;
		 $this->db->update('usuario', $dados, $condicao);
		 if ($this->db->affected_rows()>0):
		 //auditoria('Alteração de usuários', 'Alterado cadastro do usuário "'.$usuario.'"');
		 set_msg('msgok', '<div class="alert alert-success"><strong>Alteração efetuada com sucesso</strong>!</div>', 'erro');
		 else:
		 set_msg('msgerro', '<div class="alert alert-danger"><strong>Erro ao atualizar dados</strong>.</div>', 'erro');
		 endif;
		 if ($redir) redirect(current_url());*/
		endif;
	}

	public function do_updateUser($dados = NULL, $condicao = NULL) {//, $redir=TRUE
		if ($dados != NULL && $condicao != NULL) ://is_array($condicao!=NULL)
			$this -> db -> update('usuario', $dados, $condicao);
			if ($this -> db -> affected_rows() > 0) :
				//auditoria('Alteração de usuários', 'Alterado cadastro do usuário "'.$usuario.'"');
				set_msg('msgok', '<div class="alert alert-success"><strong>Alteração efetuada com sucesso</strong>!</div>', 'sucesso');
			else :
				set_msg('msgerro', '<div class="alert alert-danger"><strong>Erro ao atualizar dados</strong>.</div>', 'sucesso');
			endif;
			redirect(current_url());

		endif;
	}

	public function do_delete($condicao = NULL, $redir = TRUE) {
		if ($condicao != NULL && is_array($condicao)) :
			$usuario = $this -> usuarios -> get_byid($condicao['codusuario']) -> row() -> login;
			$this -> db -> delete('usuario', $condicao);
			if ($this -> db -> affected_rows() > 0) :
				//auditoria('Exclusão de usuários', 'Excluído cadastro do usuário "'.$usuario.'"');
				set_msg('msgok', '<div class="alert alert-success"><strong>Registro excluído com sucesso</strong>!</div>', 'sucesso');
			else :
				set_msg('msgerro', '<div class="alert alert-danger"><strong>Erro ao excluir registro</strong>.</div>', 'sucesso');
			endif;
			if ($redir)
				redirect(current_url());
		endif;
	}

	public function do_login($usuario = NULL, $senha = NULL) {
		if ($usuario && $senha) :
			$this -> db -> where('codusuario', $usuario);
			$this -> db -> where('password', $senha);
			$this -> db -> where('statusUser', 1);
			$query = $this -> db -> get('usuario');
			if ($query -> num_rows == 1) :
				return TRUE;
			else :
				return FALSE;
			endif;
		else :
			return FALSE;
		endif;
	}

	public function get_bylogin($login = NULL) {
		if ($login != NULL) :
			$this -> db -> where('codusuario', $login);
			$this -> db -> limit(1);
			return $this -> db -> get('usuario');
		else :
			return FALSE;
		endif;
	}

	public function get_byemail($email = NULL) {
		if ($email != NULL) :
			$this -> db -> where('email', $email);
			$this -> db -> limit(1);
			return $this -> db -> get('usuario');
		else :
			return FALSE;
		endif;
	}

	public function get_byid($id = NULL) {
		if ($id != NULL) :
			$this -> db -> where('codusuario', $id);
			$this -> db -> limit(1);
			return $this -> db -> get('usuario');
		else :
			return FALSE;
		endif;
	}

	public function get_all() {//$qtde=0,$inicio=0
		//if($qtde > 0)$this->db->limit($qtde,$inicio);
		$this -> db -> select('*');
		$this -> db -> from('usuario');
		$this -> db -> join('perfil', 'perfil.codperfil = usuario.fk_codperfil');
		return $query = $this -> db -> get();
	}

	public function get_all_perfil() {

		return $this -> db -> count_all('chamados');
	}

	public function get_usersAtendente($id = NULL) {
		$this -> db -> where('codusuario', $id);
		return $this -> db -> get('usuario');
	}

	public function get_usersSuporte($id = NULL) {
		$this -> db -> where('suporte', 2);
		$this -> db -> or_where('suporte', 1);
		if ($id != NULL)
			$this -> db -> where('codusuario', $id);

		return $this -> db -> get('usuario');
	}

	public function get_usersComuns($usuario = NULL) {
		$this -> db -> where('suporte', 0);
		if ($usuario != NULL)
			$this -> db -> where('codusuario', $usuario);
		return $this -> db -> get('usuario');
	}
        
        
        public function get_informacoes_requerimentos($usuario = NULL) {//$qtde=0,$inicio=0
		//if($qtde > 0)$this->db->limit($qtde,$inicio);

        	$sql = "select 
						usuario.nome as nome,
					    usuario.codusuario as codusuario,
					    curso.nome as curso,
					    semestre.descricao as semestre
    
					from 
						usuario,
						perfil,
						aluno_turma,
						turma_disciplina,
					    curso,
					    semestre
					where 
						perfil.codperfil = usuario.fk_codperfil 
					    and aluno_turma.fk_codusuario = usuario.codusuario
					    and turma_disciplina.id_turma_disciplina = aluno_turma.fk_turma_disciplina
					    and curso.codcurso = turma_disciplina.curso_codcurso
					    and semestre.codsemestre = turma_disciplina.fk_codsemestre
					    and usuario.codusuario = '".$usuario."'";
					
				$query =$this->db->query($sql);
				return $query->result();

				/*
		$this -> db -> select('*');
		$this -> db -> from('usuario');
		$this -> db -> join('perfil', 'perfil.codperfil = usuario.fk_codperfil');
                $this -> db -> join('aluno_turma', 'aluno_turma.fk_codusuario = usuario.codusuario');
        $this -> db -> join('turma_disciplina', 'turma_disciplina.id_turma_disciplina = aluno_turma.fk_turma_disciplina');
               // $this -> db -> join('disciplina', 'disciplina.coddisciplina = aluno_turma.fk_coddisciplina');*/

		//return $query = $this -> db -> get();
	}

}

/* End of file usuario_model.php */
/* Location: ./application/models/usuario_model.php */

