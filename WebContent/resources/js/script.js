$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

// botao excluir
$("#excluirModal").on('click', function() {
	var categoriaId = $("#categoriaId").val();
	$.ajax({
		// caminho servlet
		url : "/ProjetoFinal/CategoriaExcluir",
		type : "POST",
		data : {
			id : categoriaId
		},
		success : function() {
			// esconder linha ta tabela
			$('button[value=' + categoriaId + ']').closest('tr').fadeOut();
			// modal esconder
			$('#excluirModal').modal("hide");
		}
	});
});