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

<title>Brinquedos Asiaticos</title>

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
		<jsp:include page="../../resources/include/layoutAdm.jsp" flush="true"></jsp:include>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Lista de Categorias</h1>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<!-- Lista Categorias -->
						<table class="table table-striped">
							<tr>
								<th>Código</th>
								<th>Nome</th>
								<th>Linha</th>
								<th>Faixa Etária</th>
								<th>Alterar</th>
							</tr>
							<c:forEach var="listaBrinquedo" items="${ requestScope.listarProdutos }">
								<tr>
									<td>${listaBrinquedo.produtoId}</td>
									<td>${listaBrinquedo.nome}</td>
									<td>${listaBrinquedo.img}</td>
									<td>${listaBrinquedo.preco}</td>
									<td>${listaBrinquedo.descricao}</td>
									<td>${listaBrinquedo.categoriaId}</td>
									<td><a
										href="#"><img
											class="img-responsive" src="resources/imgs/outros/edit.png"
											alt="editar categoria"></a><a href="" data-toggle="modal"><img
											class="img-responsive" src="resources/imgs/outros/delete.png"
											alt="excluir categoria"></a></td>
								</tr>
							</c:forEach>
						</table>
						<!-- end Lista Categorias -->
					</div>
				</div>

				<!-- Adicionar categoria -->
				<section id="registro">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 text-center">
								<h2>Adicione uma categoria</h2>
								<h3>Seja objetivo na criação das mesmas. Evite
									redundancias.</h3>
								<br>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 text-center">
								<!-- MODAL botao -->
								<button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal" data-target="#myModal">Adicionar</button>
							</div>
						</div>
					</div>
				</section>

			</div>
		</div>

		<!-- /#page-content-wrapper -->
	</div>
				<!-- Brinquedos 				
				<c:forEach var="brinquedo" items="${ requestScope.listarProdutos }" varStatus="number">
					<div class="col-md-4 product">
						<img src="${brinquedo.img}" class="img-responsive product-image"
							alt="${brinquedo.descricao}"> <br>

						<span class="product product-name">${brinquedo.nome}</span>
						<span class="product product-description">${brinquedo.descricao}</span>
						<span class="product product-price">R$ ${brinquedo.preco}</span> 
						<span class="product product-details"><a href="#">+Detalhes</a></span>

					</div>
					<c:if test="${ number.count % 3 == 0 }"><div class="row col-md-12"><hr></div></c:if>
				</c:forEach>
			Fim_Brinquedos -->

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
