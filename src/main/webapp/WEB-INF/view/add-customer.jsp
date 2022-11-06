<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<!-- appointments23:19-->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<title>Customer Relationship Manager</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	<div class="main-wrapper">
		<div class="header">
			<div class="header-left">
				<a href="${pageContext.request.contextPath}/systems" class="logo"> <img
					src="${pageContext.request.contextPath}/resources/img/logo.png"
					width="35" height="35" alt=""> <span>MEDILAB</span>
				</a>
			</div>
			<a id="toggle_btn" href="javascript:void(0);"><i
				class="fa fa-bars"></i></a> <a id="mobile_btn"
				class="mobile_btn float-left" href="#sidebar"><i
				class="fa fa-bars"></i></a>
			<ul class="nav user-menu float-right">
				<li class="nav-item dropdown has-arrow"><a href="#"
					class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
						<span class="user-img"><img class="rounded-circle"
							src="${pageContext.request.contextPath}/resources/img/user.jpg"
							width="40" alt="Admin"> <span class="status online"></span></span>
						<span>${user.firstName}</span>
				</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="profile.html">My Profile</a>
							<form:form
								action="${pageContext.request.contextPath}/logout" method="POST">

								<input type="submit" class="dropdown-item" style="cursor: pointer;" value="Logout" />

							</form:form>
					</div></li>
			</ul>
			<div class="dropdown mobile-user-menu float-right">
				<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" href="profile.html">My Profile</a> <a
						class="dropdown-item" href="edit-profile.html">Edit Profile</a> <a
						class="dropdown-item" href="settings.html">Settings</a> <a
						class="dropdown-item" href="login.html">Logout</a>
				</div>
			</div>
		</div>
		<div class="sidebar" id="sidebar">
			<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="menu-title">Main</li>
						<li><a href="index-2.html"><i class="fa fa-dashboard"></i>
								<span>Dashboard</span></a></li>
						<li class="submenu"><a href="#"><i class="fa fa-user"></i>
								<span> Customers </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="${pageContext.request.contextPath}/systems/customer/list">Customers List</a></li>
								<li><a href="${pageContext.request.contextPath}/systems/customer/addCustomer">Add Customer</a></li>
								<li><a href="${pageContext.request.contextPath}/systems/customer/editCustomer">Edit Customer</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="page-wrapper">
			<div class="content">
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<h4 class="page-title">Add Customer</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<form:form action="saveCustomer" modelAttribute="customer"
							method="POST">
							<!-- Need the associate this data with customer id -->
							<form:hidden path="id" />

							<div class="form-group">
								<label>First Name</label>
								<form:input path="firstName" cssClass="form-control" />
							</div>
							<div class="form-group">
								<label>Last Name</label>
								<form:input path="lastName" cssClass="form-control" />
								<form:errors path="lastName"
									cssStyle="font-size: 10px; color: red;" />
							</div>
							<div class="form-group">
								<label>Email (*)</label>
								<form:input path="email" cssClass="form-control" type="email" />
								<form:errors path="email"
									cssStyle="font-size: 10px; color: red;" />
							</div>
							<div class="m-t-20 text-right">
								<a class="btn btn-secondary"
									href="${pageContext.request.contextPath}/systems/customer/list"><i
									class="fa fa-undo"></i> Back</a>
								<button class="btn btn-primary" onclick="sweet()">
									<i class="fa fa-save"></i> Save Customer
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar-overlay" data-reff=""></div>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script>
		$(function() {
			$('#datetimepicker3').datetimepicker({
				format : 'LT'
			});
			$('#datetimepicker4').datetimepicker({
				format : 'LT'
			});
		});
	</script>
</body>


<!-- appointments23:20-->
</html>