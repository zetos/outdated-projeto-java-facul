package service;

import java.util.List;

import javax.ws.rs.*;
import com.thoughtworks.xstream.XStream;

import bean.Produto;
import bean.Usuario;
import dao.ProdutoDAO;
import dao.UsuarioDAO;

@Path("/")
public class WebService {
	
	//Objeto que converte o objeto em XML e vice-versa
	private XStream conversor = new XStream();
	private ProdutoDAO daoProduto;
	private UsuarioDAO daoUsuario;
	
	public WebService(){
		try {
			daoProduto = new ProdutoDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	@GET
	public String teste() {
		return "WebService On-line...";
	}
	
	@GET
	@Path("produto/{id}")
	@Produces("application/xml")
	public String pesquisarAluno(@PathParam("id") int id) throws Exception {
		
		Produto produto = daoProduto.procurar(id);
		conversor.alias("produto", Produto.class);
		
		if (produto != null)
			return conversor.toXML(produto);
		else
			return conversor.toXML(null);
	}
	
	@POST
	@Path("produto")
	@Produces("application/xml")
	public String inserir(String xml) {
		
		conversor.alias("produto", Produto.class);
		
		Produto produto = (Produto) conversor.fromXML(xml);
		
		try {
			daoProduto.salvar(produto);
			return conversor.toXML(true);
		} catch (Exception e) {
			e.printStackTrace();
			return conversor.toXML(false);			
		}
		
	}
	
	@PUT
	@Path("produto")
	@Produces("application/xml")
	public String atualizar(String xml) {
		conversor.alias("produto", Produto.class);
	
		Produto produto = (Produto) conversor.fromXML(xml);	
		
		try {
			daoProduto.atualizar(produto);
			//Envia o valor true em caso de sucesso
			return conversor.toXML(true);
		} catch (Exception e) {
			e.printStackTrace();
			//Envia o valor false em caso erro na atualização
			return conversor.toXML(false);
		}
	}
	
	@DELETE
	@Path("produto/{id}")
	@Produces("application/xml")
	public String excluirAluno(@PathParam("id") int id) {
		try {
			daoProduto.excluir(id);
			return conversor.toXML(true);
		} catch (Exception e) {
			e.printStackTrace();
			return conversor.toXML(false);
		}
	}
	
	@GET
	@Path("produtos")
	@Produces("application/xml")
	public String listarTodosAlunos() throws Exception {
		conversor.alias("produto", Produto.class);
		
		conversor.alias("produtos", List.class);

		List<Produto> produtos = daoProduto.listarProdutos();
		
		if (produtos != null)
			return conversor.toXML(produtos);
		else
			return conversor.toXML(null);
	}	
	
	@POST
	@Path("logar")
	public boolean logar(String xml) throws Exception {
		conversor.alias("adm", Usuario.class);
		
		Usuario adm = (Usuario) conversor.fromXML(xml);			
		
		return daoUsuario.Logar(adm.getNome(), adm.getSenha());
	}	
}
