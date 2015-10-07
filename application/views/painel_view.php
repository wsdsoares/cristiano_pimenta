<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title><?php if(isset($titulo)): ?>{titulo} | <?php endif; ?>{titulo_padrao}</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="portalatenas, portal faculdade atenas, portal educacional faculdade atenas">
		<meta name="author" content="Willian Soares Damasceno, Wesley Junior de Castro Ribeiro, Antônio Bento Alves">
		
		
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
                <link href="sticky-footer.css" rel="stylesheet">
        							        <!--Chamando a DataTables -->
		<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.8/css/jquery.dataTables.min.css">
		<script type="text/javascript" charset="utf-8" src="http://cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>
		
							<!--Chamando o Menu personalizado 'textoArea' -->
		<script type="text/javascript" src="<?php echo site_url('tiny_mce/tiny_mce.js');?>"></script>
		<script language='JavaScript'> 
			//Bloqueador de Selecao - iceBreaker http://www.icebreaker.com.br/ 
			function bloquear(e){return false} 
			function desbloquear(){return true} 
			document.onselectstart=new Function (&quot;return false&quot;) 
			if (window.sidebar){
				document.onmousedown=bloquear 
				document.onclick=desbloquear
			} 
		</script>
		<script>      
		function click() {       
			if (event.button==2||event.button==3) {       
				oncontextmenu=&#39;return false&#39;;       
			}       
		}       
		document.onmousedown=click       
		document.oncontextmenu = new Function(&quot;return false;&quot;)       
		</script>
		<script type="text/javascript">
			tinyMCE.init({
				// General options
				mode : "textareas",
				theme : "advanced",
				plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

				// Theme options
				theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,cleanup,|,forecolor,backcolor ",
				theme_advanced_buttons2 : "formatselect,fontselect,fontsizeselect,styleselect",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "left",
				theme_advanced_statusbar_location : "bottom",
				theme_advanced_resizing : true,

				// Example content CSS (should be your site CSS)
				content_css : "css/content.css",

				// Drop lists for link/image/media/template dialogs
				template_external_list_url : "lists/template_list.js",
				external_link_list_url : "lists/link_list.js",
				external_image_list_url : "lists/image_list.js",
				media_external_list_url : "lists/media_list.js",

				// Style formats
				style_formats : [{
					title : 'Bold text',
					inline : 'b'
				}, {
					title : 'Red text',
					inline : 'span',
					styles : {
						color : '#ff0000'
					}
				}, {
					title : 'Red header',
					block : 'h1',
					styles : {
						color : '#ff0000'
					}
				}, {
					title : 'Example 1',
					inline : 'span',
					classes : 'example1'
				}, {
					title : 'Example 2',
					inline : 'span',
					classes : 'example2'
				}, {
					title : 'Table styles'
				}, {
					title : 'Table row 1',
					selector : 'tr',
					classes : 'tablerow1'
				}],

				// Replace values for the template plugin
				template_replace_values : {
					username : "Some User",
					staffid : "991234"
				}
			}); 
		</script>						
							<!-- Script Tooltip -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
		<![endif]-->
		{headerinc}
	</head>
	<body ondragstart='return false' onselectstart='return false' onkeydown='return validateKey(event)' oncontextmenu='return false'>
            
        <div id="wrapper">

			<!-- Navigation -->
			<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					
				</div>
				
				<!--- ************************************ Fim menu navegação superior *************************************************-->
				
				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav" id="side-menu">
							<li>
                                <!--  MENU INICIO   -->
                                <?php echo anchor('painel', '<i class="fa fa-home"></i> Inicio</a>'); ?>
							</li>
							 <li>
				                 <?php echo anchor('inscricoes/inscrever', '<i class="fa fa-user"></i> <span> Inscrever-se</span>'); ?>
					        </li>
                            <li>
				                 <?php echo anchor('inscricoes/lista_inscritos', '<i class="fa fa-file-text"></i> <span> Lista de inscritos</span>'); ?>
					        </li>
						</ul>

					</div>
				</div>
			</nav>
			<!--- ************************************ Fim Menus da laterais esquerda do painel *************************************************-->

			<!--/********************************************************************************************************************************************
			*
			* Modificado por: Willian Soares Damasceno
			* email:wilhaods@gmail.com
			* modificação: 06-05-2015
			* funçao: Corpo de todas as páginas
			*
			********************************************************************************************************************************************
			*/ -->
                        
                    <div id="page-wrapper">
                            <div class="container-fluid">
                                    <div class="row">
                                    </div>
                                    {conteudo}
                            </div>
                    </div>
		</div>

		{rodape}
		<!-- Carregamento de recursos no fim da página-->
		{footerinc}
		
    </body>
</html>