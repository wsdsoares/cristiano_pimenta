
<aside class="right-side">
    <section class="content-header">
        
        <div class="box-header">
        	<h3 class="box-title center">Períodos
            	<small> - Períodos disponíveis</small>
            </h3> 
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
                            Selecione seu período.
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                   
                                   
                                   <div class="col-lg-4 col-md-0">
			                            <div class="panel panel-info">
			                            	<?php
			                            	$turma = 1;
			                            	echo anchor('inscricoes/lista_inscritos/'.$turma,'
			                            	
			                                <div class="panel-heading">
			                                    <div class="row">
			                                        <div class="col-xs-12 text-right">
	                                                   <img src="'.base_url().'assets/img/view_1.png">
			                                        </div>
			                                    </div>
			                                </div>');
			                                
			
			                                  echo anchor('inscricoes/lista_inscritos/'.$turma,'
			                                  
			                                    <div class="panel-footer">
			                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                                         <span class="pull-left">Ver lista de inscritos</span>
			                                        <div class="clearfix">
			                                        </div>
			                                    </div>');
			
			                                ?>
			                            </div>
			                        </div>
			                        
			                        
			                        
			                         <div class="col-lg-4 col-md-0">
			                            <div class="panel panel-info">
			                            	<?php
			                            	$turma = 3;
			                            	echo anchor('inscricoes/lista_inscritos/'.$turma,'
			                            	
			                                <div class="panel-heading">
			                                    <div class="row">
			                                        <div class="col-xs-12 text-right">
	                                                   <img src="'.base_url().'assets/img/view_3.png">
			                                        </div>
			                                    </div>
			                                </div>');
			                                
			                                  echo anchor('inscricoes/lista_inscritos/'.$turma,'
			                                    <div class="panel-footer">
			                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                                        <span class="pull-left">Ver lista de inscritos</span>
			                                        <div class="clearfix">
			                                        </div>
			                                    </div>');
			
			                                ?>
			                            </div>
			                        </div>
                                   
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