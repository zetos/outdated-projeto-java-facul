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

<title>Loja de brinquedos - Categorias</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- Custom CSS -->
<link href="resources/css/simple-sidebar.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">


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
		<jsp:include page="resources/include/layoutAdm.jsp" flush="true"></jsp:include>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Lista de Categorias</h1>
						<p>Seja objetivo na criação das mesmas. Evite redundancias.</p>
					</div>

				</div>
				<hr>
				<br>
			<div class="row">
				<div class="col-lg-12">
					<!-- Lista Jedi -->

					<table class="table table-striped">
						<tr>
							<th colspan="10"><h3>Categorias</h3></th>
						</tr>
						<tr>
							<th>Nome</th>
							<th>Código</th>
							<th>Linha</th>
							<th>Faixa Etária</th>
							<th>Alterar</th>
						</tr>
						<c:forEach var="lista" items="${ requestScope.todosJedi }">
							<tr>
								<td>${lista.nome}</td>
								<td>${lista.categoriaId}</td>
								<td>${lista.linha}</td>
								<td>${lista.faixaEtaria}</td>
								<td><a href=""><img
										class="img-responsive" src="resources/imgs/outros/edit.png" alt=""></a></td>
								<td><a href=""><img
										class="img-responsive" src="resources/imgs/outros/delete.png" alt=""></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>

						</div>

		<!-- /#page-content-wrapper -->
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
