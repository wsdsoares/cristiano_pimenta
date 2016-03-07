<?php

$periodo = $this->uri->segment(3);
?>
<aside class="right-side">
    <section class="content-header">
        
        <div class="box-header">
        	
        	<?php
        	if($periodo==3):
        	?>
        	<h3 class="box-title center"> LISTA DE INSCRIÇÃO<img src="<?php echo base_url()?>assets/img/view_3.png" height='64' width="64">
        		<small> Alunos do 3º Período</small>
    		</h3> 
        	<?php
			else:
        	?>
        	<h3 class="box-title center"> LISTA DE INSCRIÇÃO<img src="<?php echo base_url()?>assets/img/view_1.png" height='64' width="64">
        		<small> Alunos do 1º Período</small>
        	</h3> 
        	<?php
			endif;
        	?>
            
        </div>
        <ol class="breadcrumb">
          <?php   echo breadcrumb();?>
        </ol>
    </section>
	   <section class="content">
           <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	
                        	<?php
				        	if($periodo==3):
				        	?>
		                    <small>Lista inscritos</small>
		                    <strong> Alunos do 3º Período</strong>
		                    <?php
							elseif($periodo==1):
				        	?>
				        	<small>Lista inscritos</small>
		                    <strong> Alunos do 1º Período</strong>
				        	<?php
							endif;
				        	?>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="table-responsive">
                        <div class="panel-body">
                        	<!--p align="right"><?php echo anchor('jornadatematica/inscricao', '<i class="btn btn-success"><i class="fa fa-pencil-square-o"></i> Escreve-lo</i> </a>');?></p-->
                            <div class="dataTable_wrapper">
						 <table class="table table-hover" id="example" cellspacing="0" cellpadding="0"> 
									<thead>
									    <tr>
									      <th>#</th>
									      <th>Matrícula</th>
									      <th>Nome</th>
									      <th>Turma</th>
									      <th>Periodo</th>
									      <th>Data inscricao</th>
									      <!--th></th>
									      <th></th-->
									    </tr>
									</thead>
									<tbody>
							  <?php
							  		
									$inscritos = $this->inscricoes->get_inscricoes($periodo)->result();
									$cont = 0;
									foreach ($inscritos as $linha) :
										$cont +=1;
										echo '<tr>';
										printf('<td>%s</td>',$cont);
										printf('<td>%s</td>',$linha->matricula);
										printf('<td>%s</td>',$linha->nome);
										printf('<td>%s</td>',$linha->turma);
										printf('<td>%s</td>',$linha->periodo);
										printf('<td>%s</td>',$linha->data);
										echo '</tr>';
									endforeach;
									?>
									</tbody>
								</table>  
							</div>
							<?php echo anchor('painel', 'Voltar', array('class'=>'btn btn-danger margin10px'));?>
                        </div><!-- /.box -->
                    </div><!--/.col (left) -->
                </div>
               </div>
              </div>   <!-- /.row -->
            </section><!-- /.content -->
		   
		
   
</aside>
