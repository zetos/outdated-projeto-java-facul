<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- NAVBAR -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
<<<<<<< HEAD
			<a class="navbar-brand" href="/ProjetoFinal/Home">Brand</a>
=======
			<a class="navbar-brand" href="#">Brinquedos Asiaticos</a>
>>>>>>> bfdef05d92a18d12ef65fb3139ad1fdda7b19563
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
       <li><a href="#">Login</a></li>
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
				<li><a href="Home?categoriaId=${lista.categoriaId}"> ${lista.nome} </a></li>
			</c:forEach>
		</ul>
	</div>
	<!-- /#sidebar-wrapper -->
</nav>

<!-- Footer -->
<footer class="panel-footer">
	<div id="footer">
		<div class="container">
			<div class="col-lg-12 text-center">Copyright &copy; Asia Corp 2015</div>
		</div>
	</div>
</footer>

