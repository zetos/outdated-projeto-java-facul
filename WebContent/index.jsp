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

<title>Simple Sidebar - Start Bootstrap Template</title>

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
		<jsp:include page="resources/include/layout.jsp" flush="true"></jsp:include>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Simple Sidebar</h1>
						<p>This template has a responsive menu toggling system. The
							menu will appear collapsed on smaller screens, and will appear
							non-collapsed on larger screens. When toggled using the button
							below, the menu will appear/disappear. On small screens, the page
							content will be pushed off canvas.</p>
						<p>
							Make sure to keep all page content within the
							<code>#page-content-wrapper</code>
							.
						</p>
					</div>
					<br>
					<hr>
					<br>
							<!-- Brinquedos -->

						<c:forEach var="brinquedo" items="${ requestScope.todosJedi }">
							<div class="col-md-4 product">
								<img src="${brinquedo.imagem}" class="img-responsive product-image" alt="${brinquedo.descricao}">
								<br>
								<span class="product product-name"><p>${brinquedo.nome}</p></span>
								<span class="product product-description"><p>${brinquedo.descricao}</p></span>
								<span class="product product-price">${brinquedo.preco}</span>
								<span class="product product-details"><p><a href="#">+Detalhes</a></p></span>
							</div>
						</c:forEach>
							<!-- Fim_Brinquedos -->
							
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
