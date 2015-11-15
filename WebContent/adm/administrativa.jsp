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

	<title>Brinquedos Asiaticos - Área Administrativa</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">

	<!-- Custom CSS -->
	<link href="resources/css/simple-sidebar.css" rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet">

	<!-- Gambiarra -->
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
	<link href="../resources/css/simple-sidebar.css" rel="stylesheet">
	<link href="../resources/css/style.css" rel="stylesheet">


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
    		<jsp:include page="../resources/include/layout.jsp" flush="true"></jsp:include>

    		<!-- Page Content -->
    		<div id="page-content-wrapper">
    			<div class="container-fluid login">
    				<div class="row">
    					<h1>Área Administrativa</h1>
    				</div>
    				<hr>
    				<br>
    				<div class="row">
    					<div class="col-md-4 col-md-offset-4">
    						<form action="/ProjetoFinal/Adm" method="post" name="loginForm" id="form_login">
    							<div class="form-group">
    								<label for="exampleInputEmail1">Login</label>
    								<input type="text" name="login" class="form-control" id="inputLogin" placeholder="Login">
    							</div>
    							<div class="form-group">
    								<label for="exampleInputPassword1">Senha</label>
    								<input type="password" name="senha" class="form-control" id="inputPassword" placeholder="Senha">
    							</div>
    							<button type="submit" class="btn btn-primary btn-lg">Entrar</button>
    						</div>
    					</div>

    				</div>
    				<br />
    			</div>
    			<!-- /#page-content-wrapper -->
    		</div>

    		<!-- jQuery -->
    		<script src="resources/js/jquery.js"></script>

    		<!-- Bootstrap Core JavaScript -->
    		<script src="resources/js/bootstrap.min.js"></script>

    		<!-- Gambiarra -->
    		<script src="../resources/js/jquery.js"></script>
    		<script src="../resources/js/bootstrap.min.js"></script>
    		<script src="../resources/js/script.js"></script>
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