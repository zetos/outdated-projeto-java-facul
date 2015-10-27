<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Loja de brinquedos - Editar Categoria</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">

	<!-- Custom CSS -->
	<link href="resources/css/simple-sidebar.css" rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet">

	<!-- Gambiarra -->
	<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
	<link href="../../resources/css/simple-sidebar.css" rel="stylesheet">
	<link href="../../resources/css/style.css" rel="stylesheet">


	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
    	<div id="wrapper">
    		<!-- Page Layout -->
    		<jsp:include page="../../resources/include/layoutAdm.jsp" flush="true"></jsp:include>

    		<!-- Page Content -->
    		<div id="page-content-wrapper">
    			<div class="container-fluid">
    				<div class="row">
    					<div class="col-lg-12">
    						<h1>Editar Categoria</h1>
    						<p>Atenção na hora de editar e cuidado na hora de excluir.</p>
    					</div>
    				</div>
    				<hr>
    				<br>
    				<div class="row">
    					<div class="col-lg-8 col-lg-offset-2">
    						<jsp:useBean id="categoria" scope="session" class="bean.Categoria" />
    						<form action="/ProjetoFinal/CategoriaAlterar" method="post">
    							<table class="table table-striped">
    								<tr>
    									<td>Nome:</td>
    									<td><input class="form-control" type="text" name="nome"
    										value="${categoria.nome}" id="name_categoria"></td>
    									</tr>
    									<tr>
    										<td>ID:</td>
    										<td><input class="form-control" type="text"
    											name="categoriaId" value="${categoria.categoriaId}"
    											id="id_categoria" readonly="readonly"></td>
    										</tr>
    										<tr>
    											<td>Faixa:</td>
    											<td><select class="form-control" id="faixa"
    												name="faixaEtaria" value="${categoria.faixaEtaria}">
    												<option value="Todos">Todos</option>
    												<option value="Até 12 anos">Até 12 anos</option>
    												<option value="3 a 12 anos">3 a 12 anos</option>
    												<option value="6 a 15 anos">6 a 15 anos</option>
    											</select></td>
    										</tr>
    										<tr>
    											<td>Linha:</td>
    											<td><select class="form-control" id="linha" name="linha"
    												value="${categoria.linha}">
    												<option value="Todos">Todos</option>
    												<option value="Meninos">Meninos</option>
    												<option value="Meninas">Meninas</option>
    											</select></td>
    										</tr>
    										<tr>
    											<th colspan="2"><input type="submit"
    												class="btn btn-primary btn-lg editar-img" name="bSalvar"
    												value="Salvar" /> 
    												<a class="btn btn-default btn-lg editar-img" href="/ProjetoFinal/CategoriaListar"
    												role="button">Voltar</a></th>
    											</tr>
    										</table>
    									</form>
    								</div>
    							</div>
    						</div>
    						<!-- /#page-content-wrapper -->
    					</div>
    				</div>

    				<!-- jQuery -->
    				<script src="resources/js/jquery.js"></script>

    				<!-- Bootstrap Core JavaScript -->
    				<script src="resources/js/bootstrap.min.js"></script>

    				<!-- Menu Toggle Script -->
    				<script>
    				$("#menu-toggle").click(function(e) {
    					e.preventDefault();
    					$("#wrapper").toggleClass("toggled");
    				});
    				</script>
    			</body>

    			</html>
