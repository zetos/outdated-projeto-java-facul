$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

$(function() {
	// botao excluir
	$("#excluirCategoriaModal").on('click', function() {
		var id = $("#id").val();
		$.ajax({
			// caminho servlet
			url : "/ProjetoFinal/CategoriaExcluir",
			type : "POST",
			data : {
				id: id
			},
			success : function() {
				// esconder linha ta tabela
				$('button[value=' + id + ']').closest('tr').fadeOut();
				// modal esconder
				$('#confirmation').modal("hide");
			},
			error : function() {
				alert("error");
				$('#confirmation').modal("hide");
			}
		});
	});
	
	$("#excluirProdutoModal").on('click', function() {
		var id = $("#id").val();
		$.ajax({
			// caminho servlet
			url : "/ProjetoFinal/ProdutoExcluir",
			type : "POST",
			data : {
				id: id
			},
			success : function() {
				// esconder linha ta tabela
				$('button[value=' + id + ']').closest('tr').fadeOut();
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
		$("#id").val($(this).val());
		$('#confirmation').modal();
	});
});