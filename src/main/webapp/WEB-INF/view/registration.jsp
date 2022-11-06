<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<!-- register24:03-->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<title>User Registration Form</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<div class="main-wrapper  account-wrapper">
		<div class="account-page">
			<div class="account-center">
				<div class="account-box">
					<form:form
						action="${pageContext.request.contextPath}/register/processRegistrationForm"
						modelAttribute="crmUser" class="form-signin">
						<!-- Check for registration error -->
						<c:if test="${registrationError != null}">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Error!</strong> ${registrationError}
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</c:if>
						<div class="account-logo">
							<a href="index-2.html"><img
								src="${pageContext.request.contextPath}/resources/img/logo-dark.png"
								alt=""></a>
						</div>
						<div class="form-group">
							<label>Username</label>
							<form:input path="userName" type="text" class="form-control" />
							<form:errors path="userName"
								cssStyle="font-size: 10px; color: red;" />
						</div>
						<div class="form-group">
							<label>Password</label>
							<form:input path="password" type="password" class="form-control" />
							<form:errors path="password"
								cssStyle="font-size: 10px; color: red;" />
						</div>
						<div class="form-group">
							<label>Confirm Password</label>
							<form:input path="matchingPassword" type="password"
								class="form-control" />
							<form:errors path="matchingPassword"
								cssStyle="font-size: 10px; color: red;" />
						</div>
						<div class="form-group">
							<label>First Name</label>
							<form:input path="firstName" type="text" class="form-control" />
							<form:errors path="firstName"
								cssStyle="font-size: 10px; color: red;" />
						</div>
						<div class="form-group">
							<label>Last Name</label>
							<form:input path="lastName" type="text" class="form-control" />
							<form:errors path="lastName"
								cssStyle="font-size: 10px; color: red;" />
						</div>
						<div class="form-group">
							<label>Email Address</label>
							<form:input path="email" type="email" class="form-control" />
							<form:errors path="email" cssStyle="font-size: 10px; color: red;" />
						</div>
						<div class="form-group checkbox">
							<label> <input type="checkbox"> I have read and
								agree the Terms & Conditions
							</label>
						</div>
						<div class="form-group text-center">
							<button class="btn btn-primary account-btn" type="submit">Signup</button>
						</div>
						<div class="text-center login-link">
							Already have an account? <a
								href="${pageContext.request.contextPath}/showMyLoginPage">Login</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>


<!-- register24:03-->
</html>