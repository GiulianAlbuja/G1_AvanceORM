<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icon1.png" type="image/x-icon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/predeterminados.css" />
	<script src="${pageContext.request.contextPath}/js/error.js"></script>
	

<title>Mi Chaucherita</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
</head>
	
<body>
	<div class="container-fluid login">
		<!-- Login Form -->
		<div class="container px-5 pt-5">
			<div class="row align-items-center my-5 py-5">
				<div class="col-6 mb-5">
					<div class="card bg-glass ms-5">
						<div class="card-body pt-5 pb-4 px-5">
							<h1 class="text-center mb-5">Login</h1>
						
							<!-- FORM -->
												
							<form action="${pageContext.request.contextPath}/LoginController?ruta=ingresar" method="POST">
								<!-- User -->
								<div class="form-outline mb-4 d-flex align-items-center">
									<i class="fa-lg fa-solid fa-user me-2"></i> <input type="text"
										id="impUsuario" name="usuario" placeholder="Usuario"
										class="form-control" />
								</div>
								<!-- Password -->
								<div class="form-outline mb-1 d-flex align-items-center">
									<i class="fa-lg fa-solid fa-lock me-2"></i> <input
										type="password" id="impPassword" name="password"
										placeholder="Contraseña" class="form-control" />
								</div>
								<div class="d-flex justify-content-center mb-3">
							<div id="mensaje-error" class="text-danger  <%= request.getAttribute("mensajeError") != null ? "" : " d-none" %>">
        							<%= request.getAttribute("mensajeError") %></div>
							</div>
								<!-- Submit button -->
								<div class="d-flex justify-content-center ">
									<button type="submit" id="btn" class="btn">INGRESAR</button>
								</div>
								
							</form>
							
							<!-- Botón para crear cuenta -->
							<div class="text-center mt-3">
								<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#createAccountModal">
									Crear una cuenta nueva
								</button>
							</div>
							
							
							<br>
							<br>
							<!-- ICONOS REDES SOCIALES -->
							<div class="text-center">
								<p class="mb-2">Síguenos en</p>
								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-facebook-f"></i>
								</button>
								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-google"></i>
								</button>
								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-twitter"></i>
								</button>
								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-github"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class=" title col-6 mb-5 mb-0" >
					<h1 class="my-5 display-5 falling-text">
						Mi chaucherita <br /> <span style="color: hsl(218, 81%, 75%)">EPN</span>
					</h1>

				</div>
			</div>
		</div>
	</div>

<!-- Modal para crear cuenta -->

	<div class="modal fade" id="createAccountModal" tabindex="-1" aria-labelledby="createAccountModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="createAccountModalLabel">Crear nueva cuenta</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form id="createAccountForm" action="${pageContext.request.contextPath}/LoginController?ruta=crear" method="POST">
	          <div class="mb-3">
	            <label for="newUsername"  class="form-label" >Correo electrónico</label>
	            <input type="email" class="form-control" name="usuario" id="newUsername" required>
	          </div>
	          <div class="mb-3">
	            <label for="newPassword" class="form-label" >Contraseña</label>
	            <input type="password" class="form-control" name="password" id="newPassword" required>
	          </div>
	          <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="termsCheck">
                        <label class="form-check-label" for="termsCheck">
                            Acepto los <a href="#" id="termsLink">términos y condiciones</a>
                        </label>
                    </div>
	          <button type="submit" id="createAccountBtn" class="btn btn-primary" disabled>Crear cuenta</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- Modal para Términos y Condiciones -->
<div class="modal fade" id="termsAndConditionsModal" tabindex="-1" aria-labelledby="termsAndConditionsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="termsAndConditionsModalLabel">Términos y Condiciones</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeTermsModal"></button>
            </div>
            <div class="modal-body">
             
        <p><strong>Bienvenido a La Chaucherita Web</strong></p>
        <p>En La Chaucherita Web, valoramos y respetamos tu privacidad. Este documento describe cómo manejamos tus datos personales de acuerdo con la Ley Orgánica de Protección de Datos Personales (LOPDP) de Ecuador. Al utilizar nuestra aplicación, aceptas los términos y condiciones descritos a continuación.</p>
        
        <h2>1. Fines del Tratamiento de Datos</h2>
        <p>Como titular de datos personales, tienes derecho a ser informado sobre el propósito del tratamiento de tus datos. En La Chaucherita Web, utilizamos tus datos para mejorar tu experiencia en nuestra aplicación, gestionar tu cuenta, y ofrecerte un servicio personalizado. La información proporcionada será utilizada para:</p>
        <ul>
            <li>Facilitar la gestión y operación de tu cuenta.</li>
            <li>Ofrecerte recomendaciones y mejoras personalizadas.</li>
            <li>Comunicarnos contigo en relación con tu cuenta y servicio.</li>
        </ul>
        
        <h2>2. Identidad del Responsable del Tratamiento</h2>
        <p>El responsable del tratamiento de tus datos personales es La Chaucherita Web. Para cualquier consulta o reclamación, puedes ponerte en contacto con nosotros a través de:</p>
        <ul>
            <li><strong>Correo electrónico:</strong> soporte@lachaucheritaweb.com</li>
            <li><strong>Dirección:</strong> Escuela Politécnica Nacional - Facultad de Sistemas, Quito, Ecuador</li>
        </ul>
        
        <h2>3. Actualización, Rectificación y Eliminación de Datos</h2>
        <p>Como titular de tus datos, tienes el derecho de solicitar la actualización, rectificación o eliminación de información incorrecta o desactualizada en tu historial. Puedes gestionar estos cambios a través de tu cuenta en nuestra aplicación o contactando a nuestro equipo de soporte.</p>
        
        <h2>4. Transferencia de Datos</h2>
        <p>La transferencia de tus datos personales no incluirá información inferida, derivada, creada o generada a partir del análisis de tus datos. Nos comprometemos a mantener la privacidad y el control sobre la información que proporcionas.</p>
        
        <h2>5. Métodos de Autenticación</h2>
        <p>Implementamos métodos de autenticación para garantizar que solo tú tengas acceso a tu información personal. Esto incluye procesos seguros de inicio de sesión y verificación para proteger tus datos.</p>
        
        <h2>6. Eliminación de Cuenta</h2>
        <p>Si decides eliminar tu cuenta, toda la información asociada a la misma será eliminada de nuestros sistemas. Puedes solicitar la eliminación de tu cuenta a través de la configuración de tu perfil o contactando a nuestro soporte.</p>

        <h2>Actualizaciones a los Términos y Condiciones</h2>
        <p>Nos reservamos el derecho de actualizar estos términos y condiciones en cualquier momento. Te notificaremos sobre cualquier cambio significativo y te recomendamos revisar esta sección regularmente para estar al tanto de cómo protegemos tus datos.</p>
        
        <h2>Aceptación</h2>
        <p>Al utilizar La Chaucherita Web, aceptas los términos y condiciones aquí descritos. Si no estás de acuerdo con alguno de estos términos, por favor no utilices nuestra aplicación.</p>
        
        <p><strong>Fecha de última actualización:</strong> 01 de agosto de 2024</p>
    </div>
            </div>
            
        </div>
    </div>
</div>
	<!-- BOOTSTRAP Y FONTAWESOME -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/87553d44ff.js"
		crossorigin="anonymous"></script>
		
		<!-- Script para habilitar/deshabilitar el botón de crear cuenta -->
	<script>
		document.getElementById('termsCheck').addEventListener('change', function () {
		    document.getElementById('createAccountBtn').disabled = !this.checked;
		});

		document.getElementById('createAccountForm').addEventListener('submit', function (e) {
		    // Aquí iría el código para crear la cuenta
		    alert('Cuenta creada exitosamente');
		    var myModalEl = document.getElementById('createAccountModal');
		    var modal = bootstrap.Modal.getInstance(myModalEl);
		    modal.hide();
		});
	</script>
	
	<script>
    // Manejar el enlace de los términos y condiciones
    document.getElementById('termsLink').addEventListener('click', function(e) {
        e.preventDefault();
        var createAccountModal = new bootstrap.Modal(document.getElementById('createAccountModal'));
        createAccountModal.hide(); // Ocultar el modal de creación de cuenta
        var termsModal = new bootstrap.Modal(document.getElementById('termsAndConditionsModal'));
        termsModal.show(); // Mostrar el modal de términos y condiciones
    });

    // Manejar el botón de cerrar en el modal de términos y condiciones
    document.getElementById('backToCreateAccountModal').addEventListener('click', function() {
        var termsModal = new bootstrap.Modal(document.getElementById('termsAndConditionsModal'));
        termsModal.hide(); // Ocultar el modal de términos y condiciones
        var createAccountModal = new bootstrap.Modal(document.getElementById('createAccountModal'));
        createAccountModal.show(); // Mostrar el modal de creación de cuenta
    });
</script>
</body>

</html>