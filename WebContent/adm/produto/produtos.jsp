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

<title>Brinquedos Asiaticos - Produtos</title>

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
					<h1>Lista de Brinquedos</h1>
				</div>
				<br>
				<div class="row">
					<!-- Lista Produtos -->
					<table class="table table-condensed table-hover">
						<tr>
							<th>Código</th>
							<th>Nome</th>
							<th>Imagem</th>
							<th>Preço</th>
							<th>Descrição</th>
							<th>Categoria</th>
							<th>Alterar</th>
							<th>Excluir</th>
						</tr>
						<c:forEach var="listaBrinquedo"
							items="${ requestScope.listarProdutos }">
							<tr>
								<td>${listaBrinquedo.produtoId}</td>
								<td>${listaBrinquedo.nome}</td>
								<td>${listaBrinquedo.img}</td>
								<td>R$ ${listaBrinquedo.preco}</td>
								<td>${listaBrinquedo.descricao}</td>
								<td>${listaBrinquedo.categoria.nome}</td>
								<td><a
									href="/ProjetoFinal/ProdutoAlterar?produtoId=${listaBrinquedo.produtoId}"><img
										class="img-responsive" src="resources/imgs/outros/edit.png"
										alt="editar categoria"></a></td>
								<td><button value="${listaBrinquedo.produtoId}"
										class="btn btn-danger btn-sm excluir">Remover</button></td>
							</tr>
						</c:forEach>
					</table>
					<!-- end Lista Categorias -->
				</div>

				<!-- Adicionar categoria -->
				<div id="registro">
					<div class="row">
						<div class="text-center">
							<h2>Adicione um Brinquedo</h2>
							<h3>Seja objetivo na criação das mesmas. Evite redundancias.</h3>
							<br>
						</div>
					</div>
					<div class="row">
						<div class="text-center">
							<!-- MODAL botao -->
							<button type="button" class="btn btn-primary btn-lg"
								data-toggle="modal" data-target="#myModal">Adicionar</button>
						</div>
					</div>
				</div>
			</div>
			<br />
		</div>
		<!-- /#page-content-wrapper -->
	</div>

	<!-- MODAL 1 INICIO -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Adicione um
						Brinquedo</h4>
				</div>
				<div class="modal-body">
					<!-- MODAL corpo -->
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
								<form action="/ProjetoFinal/ProdutoAdicionar" method="post"
									name="produtoForm" id="form_produto">
									<div class="row control-group">
										<div
											class="form-group col-xs-12 floating-label-form-group controls">
											<label>Nome do Brinquedo:</label> <input type="text"
												class="form-control" required
												placeholder="Nome do Brinquedo" name="nome"
												id="name_brinquedo"
												data-validation-required-message="Por favor insira o nome do brinquedo.">
										</div>
									</div>

									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label for="instituicao">Descrição:</label>
											<textarea class="form-control" rows="2"
												id="brinquedo_descricao" name="descricao"
												placeholder="Insira a descrição do brinquedo.." required
												data-validation-required-message="Por favor insira a descrição do brinquedo"></textarea>
										</div>
									</div>

									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label for="instituicao">Preço:</label>
											<div class="input-group">
												<div class="input-group-addon">R$</div>
												<input type="text" class="form-control" id="brinquedo_preco"
													name="preco" placeholder="Preço do brinquedo.." required
													data-validation-required-message="Por favor insira o valor do brinquedo..">
											</div>
										</div>
									</div>
									<div
										class="form-group col-xs-12 floating-label-form-group controls">
										<label>Imagem do Brinquedo:</label> <input type="text"
											class="form-control"
											placeholder="Caminho da Imagem do Brinquedo" name="nome"
											id="name_brinquedo" required
											data-validation-required-message="Por favor insira o caminho da imagem do brinquedo..">
									</div>
									<div class="row control-group">
										<div class="form-group col-xs-12 controls">
											<label>Categoria:</label> <select class="form-control"
												id="categoriaId" name="categoriaId" required
												data-validation-required-message="Por favor insira a categoria!">
												<c:forEach var="lista"
													items="${ requestScope.listarCategorias }">
													<option value="${lista.categoriaId}">${lista.nome}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="row control-group text-right">
										<div class="form-group col-xs-12 controls">
											<button type="button" class="btn btn-default btn-lg"
												data-dismiss="modal">Cancelar</button>
											<input type="submit" class="btn btn-primary btn-lg"
												value="Enviar"></input>
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
	<!-- MODAL 1 END -->

	<!-- MODAL 2 INICIO -->
	<div class="modal fade" id="confirmation">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Excluir Produto</h4>
				</div>
				<div class="modal-body">
					<!-- MODAL corpo -->
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
								<h1>Tem certeza que deseja excluir esse produto?</h1>
							</div>
						</div>
						<!-- div row -->
					</div>
					<!-- div container -->
				</div>
				<div class="modal-footer">
					<input type="hidden" name="id" id="id" />
					<button type="button" class="btn btn-default" data-dismiss="modal">cancelar</button>
					<input type="submit" id="excluirProdutoModal" value="Remover"
						class="btn btn-danger" />
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL 2 END -->

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Gambiarra -->
	<script src="../../resources/js/jquery.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script src="../../resources/js/script.js"></script>
	<script src="resources/js/script.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
</body>

</html>
