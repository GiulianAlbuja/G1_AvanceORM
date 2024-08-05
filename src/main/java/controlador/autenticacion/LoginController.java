package controlador.autenticacion;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.dao.DAOFactory;
import modelo.dao.UsuarioDAO;
import modelo.entidades.Usuario;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ruteador(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ruteador(request, response);
	}
	
	private void ruteador (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ruta = (request.getParameter("ruta") == null) ? "inicio" : request.getParameter("ruta");
		
		switch(ruta) {
		case "inicio":
			this.inicio(request, response);
			break;
		case "ingresar":
			this.ingresar(request, response);
			break;
		case "salir":
			this.salir(request, response);
			break;
		case "crear":
			this.crear(request, response);
			break;
		case "eliminar":
			this.eliminar(request, response);
			break;
			
		default:
			break;
		}
	}
	
	private void inicio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		// 1.- Obtener datos que me envian en la solicitudo

		// 2.- Llamo al modelo para obtener datos

		// 3.- Llamo a la vista
		response.sendRedirect("jsp/login.jsp");
	}
	
	private void salir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			
		request.getSession().invalidate();
		response.sendRedirect("jsp/login.jsp");
		
	}
	
	private void ingresar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		    String nombre = request.getParameter("usuario");
		    String password = request.getParameter("password");

		    Usuario usuarioAutenticado = modelo.dao.DAOFactory.getFactory().getUsuarioDAO().autorizar(nombre, password);

		    if (usuarioAutenticado != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("usuarioLogeado", usuarioAutenticado);

		        response.sendRedirect("VisualizarDashboardController?ruta=visualizar");
		        
		    } else {
		    	String mensaje = "Usuario o clave incorrectas";
		        request.setAttribute("mensajeError", mensaje); 
		        request.getRequestDispatcher("jsp/login.jsp").forward(request, response); 
		    }
	}
	
	private void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 1. Obtener datos que me env�an en la solicitud
	    String nombre = request.getParameter("usuario");
	    String password = request.getParameter("password");

	    // 3. Crear un objeto Cuenta con los datos obtenidos y el propietario obtenido de la sesion
	 	    Usuario nuevoUsuario = new Usuario();
	 	    nuevoUsuario.setNombre(nombre);
	 	    nuevoUsuario.setPassword(password);

	 	    // 4. Obtener el CuentaDAO del DAO Factory
	 	    UsuarioDAO usuarioDAO = DAOFactory.getFactory().getUsuarioDAO();

	 	    // 5. Insertar la cuenta en la base de datos utilizando el m�todo createAndPersist del JPAGenericDAO
	 	    usuarioDAO.create(nuevoUsuario);
	 	    // 6. Redirigir a la vista deseada
	 	    response.sendRedirect("jsp/login.jsp");
	}
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			// 1. Obtener datos que me env�an en la solicitud
			String idStr = request.getParameter("id");
	
			try {
			    int id = Integer.parseInt(idStr);
			    
			    // Crear un objeto Cuenta con los datos obtenidos y el propietario obtenido de la sesion
			    UsuarioDAO usuarioDAO = DAOFactory.getFactory().getUsuarioDAO();
	
			    // Insertar la cuenta en la base de datos utilizando el método createAndPersist del JPAGenericDAO
			    usuarioDAO.deleteById(id);
			    response.sendRedirect("jsp/login.jsp");
			    
			} catch (NumberFormatException e) {
			    // Manejo de error en caso de que la conversión falle
			    e.printStackTrace();
			}
	}
	}


