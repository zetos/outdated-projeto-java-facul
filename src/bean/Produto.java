package bean;

public class Produto {
	
	private int produtoId;
	private String nome;
	private String descricao;
	private String preco;
	private String img;
	private int categoriaId;
	
	public Produto() {	}
	
	public Produto(int produtoId, String nome, String descricao, String preco, String img, int categoriaId) {
		super();
		this.produtoId = produtoId;
		this.nome = nome;
		this.descricao = descricao;
		this.preco = preco;
		this.img = img;
		this.categoriaId = categoriaId;
	}
	
	public int getProdutoId() {
		return produtoId;
	}
	public void setProdutoId(int produtoId) {
		this.produtoId = produtoId;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getPreco() {
		return preco;
	}
	public void setPreco(String preco) {
		this.preco = preco;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public int getCategoria() {
		return categoriaId;
	}
	public void setCategoria(int categoriaId) {
		this.categoriaId = categoriaId;
	}

}
