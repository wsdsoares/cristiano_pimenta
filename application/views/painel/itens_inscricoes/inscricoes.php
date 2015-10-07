
<aside class="right-side">
    <section class="content-header">
        
        <div class="box-header">
        	<h3 class="box-title center">LISTA DE INSCRIÇÃO
            	<small> - Inscrever-se</small>
            </h3> 
        </div>
        <ol class="breadcrumb">
          <?php   echo breadcrumb();?>
        </ol>
    </section>
	
        <!--div class="panel panel-info">
            <div class="panel-heading">
                <strong>Atenção</strong>
            </div>
            <div class="panel-body">
                <p>
                     Ao informar o <strong><abbr title="Esse código fica no rodapé dos documentos gerados digitalmente" class="initialism">"Código de validação"</abbr></strong> deverá ser gerada
                     uma mensagem de <strong>validação </strong>confirmando a autenticidade do documento.
                </p>
                <p>
                    Caso não seja confirmada a autenticidade, esse documento torna-se <strong>inválido</strong>!
                </p>
                <br>
                <h5>Dúvidas, entre em contato com a Secretaria Acadêmica:</h5>
                
                <address>
                    <strong>Contatos</strong><br/>
                    <strong><abbr title="Telefone">Telefone:</abbr></strong> (38) 3672-3737
                    <br>

                    <strong>Email:</strong> <a href="mailto:#">secretaria@atenas.edu.br</a>
                </address>
            </div>
        </div-->
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
										echo form_open('inscricoes/inscrever');
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
									echo form_submit(array('name'=>'validar', 'class'=>'btn btn-success margin10px'), 'Validar Documento');
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