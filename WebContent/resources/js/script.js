$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

$(function() {
	// botao excluir
	$("#excluirModal").on('click', function() {
		var categoriaId = $("#categoriaId").val();
		$.ajax({
			// caminho servlet
			url : "/ProjetoFinal/CategoriaExcluir",
			type : "POST",
			data : {
				id: categoriaId
			},
			success : function() {
				// esconder linha ta tabela
				$('button[value=' + categoriaId + ']').closest('tr').fadeOut();
				// modal esconder
				$('#confirmation').modal("hide");
			},
			error : function() {
				alert("error");
				$('#confirmation').modal("hide");
			}
		});
	});

	$(".excluir").on('click', function() {
		$("#categoriaId").val($(this).val());
		$('#confirmation').modal();
	});
});