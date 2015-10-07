<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");
  
switch ($tela):
    case 'inicio':

        ?>
        <aside class="right-side">
            <ol class="breadcrumb">
                <?php echo breadcrumb(); ?>
            </ol>
                    <p>
                        <div class="col-lg-3 col-md-0">
                            <div class="panel panel-info">
                            	<?php
                            	
                            	echo anchor('inscricoes/inscrever','
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-user fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                   Inscrever.
                                            </div>
                                        </div>
                                    </div>
                                </div>');
                                

                                    echo anchor('inscricoes/inscrever','
                                    <div class="panel-footer">
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <span class="pull-left">Clique aqui para inscrever</span>
                                        <div class="clearfix">
                                        </div>
                                    </div>');

                                ?>
                            </div>
                        </div>
                    </p>
                   <p>
                        <div class="col-lg-3 col-md-0">
                            <div class="panel panel-info">
                            	<?php
                            	
                            	echo anchor('inscricoes/lista_inscritos','
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-file-text fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                   Ver lista de inscritos.
                                            </div>
                                        </div>
                                    </div>
                                </div>');
                                

                                    echo anchor('inscricoes/lista_inscritos','
                                    <div class="panel-footer">
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <span class="pull-left">Clique aqui ver lista de inscritos</span>
                                        <div class="clearfix">
                                        </div>
                                    </div>');

                                ?>
                            </div>
                        </div>
                    </p>
                
        </aside>

        <?php
    break;

    default:
        echo '<div class="alert-box alert"><p>A tela solicitada não existe</p></div>';
    break;
endswitch;
