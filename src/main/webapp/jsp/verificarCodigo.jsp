<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/icon1.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/predeterminados.css" />

<title>Verificación de Código - Chaucherita</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
</head>

<body>
	<div class="container-fluid login">
		<div class="container px-5 pt-5">
			<div class="row align-items-center my-5 py-5">
				<div class="col-6 mb-5">
					<div class="card bg-glass ms-5">
						<div class="card-body pt-5 pb-4 px-5">
							<h1 class="text-center mb-5">Verificación de Código</h1>
							<form
								action="${pageContext.request.contextPath}/LoginController?ruta=verificar"
								method="POST">
								<div class="form-outline mb-4 d-flex align-items-center">
									<label for="codigo" class="form-label me-3 mb-0">Código:</label>
									<input type="text" id="codigo" name="codigo"
										class="form-control form-control-lg" required
										autocomplete="off" />
								</div>
								<p>El código es válido hasta 10 minutos</p>
								<button class="btn btn-primary btn-lg btn-block" type="submit">Verificar</button>
							</form>
							<c:if test="${not empty mensajeError}">
								<div class="alert alert-danger mt-4">${mensajeError}</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-6">
					<img class="rounded d-block mx-auto"
						src="${pageContext.request.contextPath}/images/icon1.png" alt=""
						width="70%" />
				</div>
			</div>
		</div>
	</div>
</body>

</html>