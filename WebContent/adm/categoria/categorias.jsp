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
						<h1>Lista de Categorias</h1>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<!-- Lista Categorias -->

						<table class="table table-striped">
							<tr>
								<th colspan="6"><h3>Categorias</h3></th>
							</tr>
							<tr>
								<th>Nome</th>
								<th>Código</th>
								<th>Linha</th>
								<th>Faixa Etária</th>
								<th>Alterar</th>
								<th>Excluir</th>
							</tr>
							<c:forEach var="lista" items="${ requestScope.listarCategorias }">
								<tr>
									<td>${lista.nome}</td>
									<td>${lista.categoriaId}</td>
									<td>${lista.linha}</td>
									<td>${lista.faixaEtaria}</td>
									<td><a
										href="/ProjetoFinal/CategoriaAlterar?categoriaId=${lista.categoriaId}"><img
											class="img-responsive" src="resources/imgs/outros/edit.png"
											alt="editar categoria"></a></td>
									<td><button value="${lista.categoriaId}"
											class="btn btn-danger btn-sm excluir">Remover</button></td>
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

	<!-- MODAL inicio -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Adicione uma
						Categoria</h4>
				</div>
				<div class="modal-body">
					<!-- MODAL corpo -->
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">

								<form action="/ProjetoFinal/CategoriaAdicionar" method="post"
									name="categoriaForm" id="Form_categoria" novalidate>
									<div class="row control-group">
										<div
											class="form-group col-xs-12 floating-label-form-group controls">
											<label>Nome da Categoria:</label> <input type="text"
												class="form-control" placeholder="Nome da Categoria"
												name="nome" id="name_categoria" required
												data-validation-required-message="Por favor insira o nome da categoria.">
										</div>
									</div>

									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label>Linha:</label> <select
												class="form-control" id="categoria" name="linha" required
												data-validation-required-message="Por favor insira a linha.">
												<option value="Todos">Todos</option>
												<option value="Meninos">Meninos</option>
												<option value="Meninas">Meninas</option>
											</select>
										</div>
									</div>

									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label>Faixa Etária:</label> <select
												class="form-control" id="faixa_etaria" name="faixaEtaria"
												required
												data-validation-required-message="Por favor insira a faixa etária.">
												<option value="Todos">Todos</option>
												<option value="Ate 12 anos">Até 12 anos</option>
												<option value="3 a 12 anos">3 a 12 anos</option>
												<option value="6 a 15 anos">6 a 15 anos</option>
											</select>
										</div>
									</div>
									<br>
									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<input type="submit" class="btn btn-primary btn-lg"
												value="enviar"></input>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- div row -->
					</div>
					<!-- div container -->
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL1 END -->

	<!-- MODAL 2 INICIO -->
	<div class="modal fade" id="confirmation">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Excluir Categoria</h4>
				</div>
				<div class="modal-body">
					<!-- MODAL corpo -->
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
								<h1>Tem certeza que deseja excluir essa categoria?</h1>
							</div>
						</div>
						<!-- div row -->
					</div>
					<!-- div container -->
				</div>
				<div class="modal-footer">
					<input type="hidden" name="id" id="id" />
					<button type="button" class="btn btn-default" data-dismiss="modal">cancelar</button>
					<input type="submit" id="excluirCategoriaModal" value="Remover"
						class="btn btn-danger" />
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL2 END -->

	<!-- jQuery -->
	<!-- Gambiarra -->
	<!-- Bootstrap Core JavaScript -->
	<script src="../../resources/js/jquery.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script src="../../resources/js/script.js"></script>
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/script.js"></script>
</body>
</html>