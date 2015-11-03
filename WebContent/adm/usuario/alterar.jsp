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

	<title>Loja de brinquedos - Editar Usuários</title>

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
						<h1>Editar Usuários</h1>
						<p>Atenção na hora de editar e cuidado na hora de excluir.</p>
					</div>
				</div>
				<hr>
				<br>
				<div class="col-lg-8 col-lg-offset-2">
					<jsp:useBean id="usuario" scope="session" class="bean.Usuario" />
					<form action="/ProjetoFinal/UsuarioAlterar" method="post">
						<div class="row form-group">
							<label for="usuarioId">Usuário ID</label> <input
							class="form-control" type="text" name="usuarioId"
							value="${usuario.produtoId}" id="usuario_Id" readonly />
						</div>
						<div class="row form-group">
							<label for="usuario_login">Login</label> <input
							class="form-control" type="text" name="login"
							value="${usuario.nome}" id="usuario_login" readonly>
						</div>
						<div class="row form-group">
							<label for="usuario_nome">Nome</label>
							<input
							class="form-control" type="text" name="nome"
							value="${usuario.descricao}" id="usuario_nome" placeholder="Insira o nome do usuário.." required data-validation-required-message="Por favor insira o nome do usuario..">

						</div>
						<div class="row form-group">
							<label for="usuario_senha">Senha</label>
							<input
							class="form-control" type="text" name="senha"
							value="${usuario.descricao}" id="usuario_senha" placeholder="Insira a senha do usuario.." required data-validation-required-message="Por favor insira a senha do usuário..">

						</div>
						<div class="row form-group text-right">
							<input type="submit" class="btn btn-primary btn-lg"
							name="bSalvar" value="Salvar" /> 
							<a class="btn btn-default btn-lg"
							href="/ProjetoFinal/UsuarioListar" role="button">Voltar</a>
						</div>
					</form>
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
