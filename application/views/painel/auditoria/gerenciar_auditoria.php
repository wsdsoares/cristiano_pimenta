<?php
if (!defined("BASEPATH"))
	exit("No direct script access allowed");

$perfilUserLogado = $this -> session -> userdata('user_perfil');
if ($perfilUserLogado == 1):
?>
<script type="text/javascript">
			$(function(){
				$('.deletareg').click(function(){
					if (confirm("Deseja realmente excluir este registro?\nEsta operação não poderá ser desfeita!")) return true; else return false;
				});
			});
		</script>
		<div class="twelve columns">
			<aside class="right-side">
        <!-- Content Header (Page header) -->
            <section class="content-header">
	        	<h3 class="box-title center"><i class="fa fa-binoculars"></i> Auditoria Interna
                	<small> - Atenas</small>
                </h3>
                <ol class="breadcrumb">
                  <p><?php   echo breadcrumb();?></p>
                </ol>
		    </section> 
		    <?php
			get_msg('msgok');
			get_msg('msgerro');
			$modo = $this->uri->segment(3);
			if ($modo == 'all'):
				$limite = 0;
			else:
				$limite = 50;
				echo '<p>Mostrando os últimos 50 registros, para ver todo histórico '.anchor('auditoria/gerenciar/all', 'clique aqui').'</p>';
			endif;
			
			?>
			<table class="table table-striped table-bordered" cellspacing="0" width="100%">
				<thead>
					<tr style="background:#f1f1f1;">
						<th>Usuário</th>
						<th>Data e hora</th>
						<th>Operação</th>
						<th>Observação</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$query = $this->auditoria->get_all($limite)->result();
					foreach ($query as $linha):
						echo '<tr>';
						printf('<td>%s</td>', $linha->usuario);
						printf('<td>%s</td>', date('d/m/Y H:i:s', strtotime($linha->data_hora)));
						printf('<td>%s</td>', '<span class="has-tip tip-top" title="'.$linha->query.'">'.$linha->operacao.'</span>');
						printf('<td>%s</td>', $linha->observacao);
						echo '</tr>';
					endforeach;
					?>
				</tbody>
			</table>
			</aside>
		</div>
		<?php
else: 
	redirect('painel');
endif; 