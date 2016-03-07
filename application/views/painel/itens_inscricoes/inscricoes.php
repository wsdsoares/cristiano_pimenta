<?php
		                    		
 $periodo = $this->uri->segment(3);
?>
<aside class="right-side">
    <section class="content-header">
        
        <div class="box-header">
        	
        	<?php
        	if($periodo==1):
        	?>
        	<h3 class="box-title center"> LISTA DE INSCRIÇÃO<img src="<?php echo base_url()?>assets/img/first.png" height='64' width="64">
        		<small> Alunos do 1º Período</small>
    		</h3> 
        	<?php
			elseif($periodo==3):
        	?>
        	<h3 class="box-title center"> LISTA DE INSCRIÇÃO<img src="<?php echo base_url()?>assets/img/three.png" height='64' width="64">
        		<small> Alunos do 3º Período</small>
        	</h3> 
        	<?php
			endif;
        	?>
            
        </div>
        <ol class="breadcrumb">
          <?php   echo breadcrumb();?>
        </ol>
    </section>
	
       <?php   //erros de validação dos campos do formulário 
		   get_msg('msgok');
		   get_msg('msgerro');
		   
		?>
    <section class="content">
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Insira suas as informações
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <?php   //erros de validação dos campos do formulário 
									   erros_validacao();
									?>
								   
									<?php
										echo form_open('inscricoes/inscrever/');
									?>
                                    <div class="form-group"> 
										<label>Matrícula</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-text-height"></i></span>
		                                                                        
											<?php
												echo form_input(array('name'=>'matricula','maxlength'=>'10','class'=>'form-control','placeholder'=>'Insira sua matrícula.Ex. 08-1-123456'), set_value('matricula'),'autofocus');
											?>
										</div>
									</div>
									<div class="form-group"> 
										<label>Nome</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-text-height"></i></span>
		                                                                        
											<?php
												echo form_input(array('name'=>'nome','class'=>'form-control','placeholder'=>'Informe seu nome'), set_value('nome'));
											?>
										</div>
									</div>
									
									<div class="form-group">
		                            	<label>Turma</label>
		                            	<?php
		                            	 $options = array(
		                            	 	'' => '',
						                    'Alfa' => 'Alfa',
						                    'Beta' => 'Beta',
						                    'Gama' => 'Gama',
						                    'Delta' => 'Delta',
						                    );
						                    echo form_dropdown('turma', $options,set_value('turma'),'class="form-control"');
		                            	?>
		                    		</div>
		                    		
                                   <?php
                                   	
                                   	
                                   	
									echo form_submit(array('name'=>'validar', 'class'=>'btn btn-success margin10px'), 'Inscrever');
									echo anchor('painel', 'Voltar', array('class'=>'btn btn-danger margin10px'));
									echo form_hidden('periodo',$periodo);
									echo form_close();
									
									
									?>
                                </div>
                               
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
    </section>
</aside>
<script>
	$('document').ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>