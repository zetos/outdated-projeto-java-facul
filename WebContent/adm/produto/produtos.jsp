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
						<h1>Lista de Brinquedos</h1>
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
								<th>Imagem</th>
								<th>Descrição</th>
								<th>ID Categoria</th>
								<th>Alterar</th>
								<th>Excluir</th>
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
											alt="editar categoria"></a></td>
											<td><input data-toggle="modal" data-target="#excluirModal" type="image" class="img-responsive"
										src="resources/imgs/outros/delete.png" alt="excluir categoria" />
									</td>
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
								<h2>Adicione um Brinquedo</h2>
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
					<h4 class="modal-title" id="myModalLabel">Adicione um Brinquedo</h4>
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
											<label>Nome do Brinquedo:</label> <input type="text"
												class="form-control" placeholder="Nome do Brinquedo"
												name="nome" id="name_brinquedo" required
												data-validation-required-message="Por favor insira o nome do brinquedo.">
										</div>
									</div>

									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label for="instituicao">Descrição:</label> 
											<textarea class="form-control" rows="2" id="brinquedo_descricao" name="descricao" placeholder="Insira a descrição do brinquedo.." required data-validation-required-message="Por favor insira a descrição do brinquedo"></textarea>
										</div>
									</div>

									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label for="instituicao">Preço:</label> 
											<div class="input-group">
												<div class="input-group-addon">R$</div>
												<input type="text" class="form-control" id="brinquedo_preco" name="preco" placeholder="Preço do brinquedo.." required required data-validation-required-message="Por favor insira o valor do brinquedo..">
												<div class="input-group-addon">.00</div>
											</div>
										</div>
									</div>

									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label for="instituicao">Categoria:</label> <select
											class="form-control" id="categoria" name="linha" required
											data-validation-required-message="Por favor insira a linha.">
											<c:forEach var="lista" items="${ requestScope.listarCategorias }">
											<option value="${lista.categoriaId}">${lista.nome}</option>
										</c:forEach>
									</select>
								</div>
							</div>

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
	<div class="modal fade" id="excluirModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
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
								<button type="button" id="excluirModal" class="btn btn-danger">Excluir</button>
							</div>
						</div>
						<!-- div row -->
					</div>
					<!-- div container -->
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL2 END -->

	<!-- Gambiarra -->
<script src="../../resources/js/jquery.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
<script src="../../resources/js/script.js"></script>

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
