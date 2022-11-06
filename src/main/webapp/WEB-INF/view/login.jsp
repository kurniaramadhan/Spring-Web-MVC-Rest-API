<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">


<!-- login23:11-->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico">
<title>MEDILAB</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<div class="main-wrapper account-wrapper">
		<div class="account-page">
			<div class="account-center">
				<div class="account-box">
					<form action="${pageContext.request.contextPath}/authenticateTheUser"
						method="POST" class="form-signin">
						<div class="account-logo">
							<a href="index-2.html"><img src="resources/img/logo-dark.png" alt=""></a>
						</div>
						<!-- Check for error -->
						<c:if test="${param.error != null}">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Error!</strong> Sorry, you entered<a href="#"
									class="alert-link"> invalid</a> username and password.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Success!</strong> You has been<a href="#"
									class="alert-link"> logged out</a> successfully.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</c:if>
						<div class="form-group">
							<label>Usename</label> <input type="text" name="username" autofocus="" class="form-control">
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" name="password" class="form-control">
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-primary account-btn">Login</button>
						</div>
						<div class="text-center register-link">
                            <a href="${pageContext.request.contextPath}/">Back To Home</a> | <a href="${pageContext.request.contextPath}/register/showRegistrationForm">Register Now</a>
                        </div>
						
						<!-- Add csrf manually -->
						<input type="hidden"
						name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/app.js"></script>
</body>


<!-- login23:12-->
</html>