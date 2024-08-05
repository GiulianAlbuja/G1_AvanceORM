package controlador.autenticacion;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resend.Resend;
import com.resend.core.exception.ResendException;
import com.resend.services.emails.model.CreateEmailOptions;
import com.resend.services.emails.model.CreateEmailResponse;

import modelo.dao.DAOFactory;
import modelo.dao.UsuarioDAO;
import modelo.entidades.Usuario;
import utils.BCryptUtil;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.ruteador(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.ruteador(request, response);
	}

	private void ruteador(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ruta = (request.getParameter("ruta") == null) ? "inicio" : request.getParameter("ruta");

		switch (ruta) {
		case "inicio":
			this.inicio(request, response);
			break;
		case "ingresar":
			this.ingresar(request, response);
			break;
		case "verificar":
			this.verificar(request, response);
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

	private void inicio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1.- Obtener datos que me envian en la solicitudo

		// 2.- Llamo al modelo para obtener datos

		// 3.- Llamo a la vista
		response.sendRedirect("jsp/login.jsp");
	}

	private void salir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getSession().invalidate();
		response.sendRedirect("jsp/login.jsp");

	}

	private void ingresar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nombre = request.getParameter("usuario");
		String password = request.getParameter("password");

		Usuario usuarioAutenticado = modelo.dao.DAOFactory.getFactory().getUsuarioDAO().autorizar(nombre, password);

		if (usuarioAutenticado != null) {
			HttpSession session = request.getSession();
			session.setAttribute("usuarioLogeado", usuarioAutenticado);

			String codigo = String.valueOf((int) (Math.random() * 9000) + 1000); // Código de 4 dígitos

			Resend resend = new Resend("re_axy8nbR8_HPmfLCvZZHv12SCWUNWGF1dN");

			String htmlContent = "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px;'>"
					+ "<h2 style='text-align: center; color: #4CAF50;'>Chaucherita</h2>" + "<p>Hola,</p>"
					+ "<p>Gracias por iniciar sesión en <strong>Chaucherita</strong>. Para completar el proceso de autenticación, por favor ingresa el siguiente código de verificación:</p>"
					+ "<h3 style='text-align: center; color: #333;'>" + codigo + "</h3>"
					+ "<p>Este código es válido por los próximos 10 minutos.</p>"
					+ "<p>Si no solicitaste este código, por favor ignora este mensaje.</p>"
					+ "<p>Saludos,<br>El equipo de Chaucherita</p>" + "<hr>"
					+ "<p style='font-size: 12px; color: #777;'>Este es un mensaje generado automáticamente, por favor no responda a este correo.</p>"
					+ "</div>";

			CreateEmailOptions params = CreateEmailOptions.builder().from("Acme <onboarding@resend.dev>").to(nombre)
					.subject("Código de verificación - Chaucherita").html(htmlContent).build();

			try {
				CreateEmailResponse data = resend.emails().send(params);
				System.out.println("Correo enviado exitosamente: " + data);

				// Guardar código y tiempo de expiración en la sesión
				session.setAttribute("codigo2FA", codigo);
				session.setAttribute("expiracion2FA", System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(10));

				response.sendRedirect("jsp/verificarCodigo.jsp");
			} catch (ResendException e) {
				e.printStackTrace();
				String mensaje = "Error al enviar el correo de verificación.";
				request.setAttribute("mensajeError", mensaje);
				request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			}

		} else {
			String mensaje = "Usuario o clave incorrectas";
			request.setAttribute("mensajeError", mensaje);
			request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
		}
	}

	private void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Obtener datos que me env�an en la solicitud
		String nombre = request.getParameter("usuario");
		String password = request.getParameter("password");
		// Encriptar la contraseña con BCrypt
		String hashedPassword = BCryptUtil.hashPassword(password);

		// 3. Crear un objeto Cuenta con los datos obtenidos y el propietario obtenido
		// de la sesion
		Usuario nuevoUsuario = new Usuario();
		nuevoUsuario.setNombre(nombre);
		nuevoUsuario.setPassword(hashedPassword);

		// 4. Obtener el CuentaDAO del DAO Factory
		UsuarioDAO usuarioDAO = DAOFactory.getFactory().getUsuarioDAO();

		// 5. Insertar la cuenta en la base de datos utilizando el m�todo
		// createAndPersist del JPAGenericDAO
		usuarioDAO.create(nuevoUsuario);
		// 6. Redirigir a la vista deseada
		response.sendRedirect("jsp/login.jsp");
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. Obtener datos que me env�an en la solicitud
		String idStr = request.getParameter("id");

		try {
			int id = Integer.parseInt(idStr);

			// Crear un objeto Cuenta con los datos obtenidos y el propietario obtenido de
			// la sesion
			UsuarioDAO usuarioDAO = DAOFactory.getFactory().getUsuarioDAO();

			// Insertar la cuenta en la base de datos utilizando el método createAndPersist
			// del JPAGenericDAO
			usuarioDAO.deleteById(id);
			response.sendRedirect("jsp/login.jsp");

		} catch (NumberFormatException e) {
			// Manejo de error en caso de que la conversión falle
			e.printStackTrace();
		}
	}

	private void verificar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false); // No crear una nueva sesión si no existe

		if (session == null) {
			// La sesión ha expirado
			String mensaje = "La sesión ha expirado. Por favor, inicie sesión nuevamente.";
			request.setAttribute("mensajeError", mensaje);
			request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			return;
		}

		String codigoIngresado = request.getParameter("codigo");
		String codigo2FA = (String) session.getAttribute("codigo2FA");
		Long expiracion2FA = (Long) session.getAttribute("expiracion2FA");

		if (codigo2FA != null && expiracion2FA != null) {
			if (System.currentTimeMillis() > expiracion2FA) {
				// Código expirado
				String mensaje = "El código ha expirado. Por favor, inicie sesión nuevamente.";
				session.invalidate(); // Invalidar la sesión
				request.setAttribute("mensajeError", mensaje);
				request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			} else if (codigo2FA.equals(codigoIngresado)) {
				// Código correcto
				response.sendRedirect("VisualizarDashboardController?ruta=visualizar");
			} else {
				// Código incorrecto
				String mensaje = "El código ingresado es incorrecto.";
				request.setAttribute("mensajeError", mensaje);
				request.getRequestDispatcher("jsp/verificarCodigo.jsp").forward(request, response);
			}
		} else {
			// No se ha generado un código 2FA
			String mensaje = "No se ha generado un código de verificación. Por favor, inicie sesión nuevamente.";
			request.setAttribute("mensajeError", mensaje);
			request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
		}
	}
}
