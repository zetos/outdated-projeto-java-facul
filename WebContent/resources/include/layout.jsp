<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- NAVBAR -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<img src="resources/imgs/outros/toy3.png" alt="logotipo" class="img-circle logo-mini">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/ProjetoFinal/Home">Brinquedos
			Asiaticos</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
		id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/ProjetoFinal/Adm">Login</a></li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->

<!-- Sidebar -->
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="#"> Categorias </a></li>
		<li><a href="Home">Todos</a></li>
		<c:forEach var="lista" items="${ requestScope.listarCategorias }">
		<li><a href="Home?categoriaId=${lista.categoriaId}">
			${lista.nome} </a></li>
		</c:forEach>
	</ul>
</div>
<!-- /#sidebar-wrapper -->
</nav>

<!-- Footer -->
<footer class="panel-footer">
	<div id="footer">
		<div class="container">
			<div class="col-lg-12 text-center">Copyright &copy; Asia Corp
				2015</div>
			</div>
		</div>
	</footer>

