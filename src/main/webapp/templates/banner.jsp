<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <nav class="navbar text-white bg-1">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 ms-3 h1">MI CHAUCHERITA</span>
            <!-- CON JSTL -->
            <span class="navbar-brand mb-0 h3" id="bienvenida">¡Bienvenido, <c:out value="${sessionScope.usuarioLogeado.nombre}"/>! </span>
            <span class="navbar-brand mb-0 me-3 h3">
            <a class="text-decoration-none text-white" href="#" data-bs-toggle="modal" data-bs-target="#accountSettingsModal">AJUSTES DE CUENTA</a></span>
            <span class="navbar-brand mb-0 me-3 h3"><a class="text-decoration-none text-white"
                    href="./LoginController?ruta=salir">SALIR</a></span>
        </div>
    </nav>
    <nav class="navbar  bg-2">
        <div class="container-fluid mx-5">
            <span class="navbar-brand mb-0 h3">
                <a class="text-decoration-none banner" href="VisualizarDashboardController?ruta=visualizar"> Mis cuentas</a>
               
                <a class="text-decoration-none ms-5 banner " href="GestionCuentaController?ruta=verMovimientosPantalla"> Mis Movimientos</a>
            </span>
            <div " >
                <span class=" navbar-brand mb-0 h3 px-5"><a class="text-decoration-none banner"
                    href="GestionCuentaController?ruta=ingresoPantalla"> Ingresar </a></span>
                <span class="navbar-brand mb-0 h3 px-5"><a class="text-decoration-none banner" href="GestionCuentaController?ruta=egresoPantalla">
                        Egresar</a></span>
                <span class="navbar-brand mb-0 h3 px-5 "><a class="text-decoration-none banner"
                        href="GestionCuentaController?ruta=transferirPantalla"> Tranferir </a></span>
            </div>
        </div>
    </nav>
    <!-- Modal de Ajustes de Cuenta -->
    <div class="modal fade" id="accountSettingsModal" tabindex="-1" aria-labelledby="accountSettingsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="accountSettingsModalLabel">Ajustes de Cuenta</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                	<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#termsAndConditionsModal">Ver términos y condiciones de privacidad</button>
                    <br><br>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Eliminar cuenta</button>
                    <br><br>NOTA: El momento de eliminar tu cuenta, La Chaucherita eliminará toda la información registrada de tu usuario y no podremos hacer uso de tu información.
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
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
	            </div>
	        </div>
	    </div>
	</div>

    <!-- Modal de Confirmación de Eliminación -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.</p>
                </div>
                <div class="modal-footer">
			    <form id="deleteAccountForm" action="./LoginController?ruta=eliminar" method="POST">
			        <input type="hidden" name="id" value="${sessionScope.usuarioLogeado.id}">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
			        <button type="submit" class="btn btn-danger">Eliminar Cuenta</button>
			    </form>
			</div>
            </div>
            
        </div>
    </div>
    
        
</body>
</html>