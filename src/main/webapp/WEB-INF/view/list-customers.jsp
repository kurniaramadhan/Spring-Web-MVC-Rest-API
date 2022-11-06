<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.dewacoding.springsecurity.demo.utils.SortUtils"%>
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
<title>MEDILAB</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link
	href="${pageContext.request.contextPath}/resources/css/sweetalert2.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="main-wrapper">
		<div class="header">
			<div class="header-left">
				<a href="${pageContext.request.contextPath}/systems" class="logo">
					<img
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
						<form:form action="${pageContext.request.contextPath}/logout"
							method="POST">

							<input type="submit" class="dropdown-item"
								style="cursor: pointer;" value="Logout" />

						</form:form>
					</div></li>
			</ul>
		</div>
		<div class="sidebar" id="sidebar">
			<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="menu-title">Main</li>
						<li><a href="${pageContext.request.contextPath}/systems"><i
								class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
						<li class="submenu"><a href="#"><i class="fa fa-user"></i>
								<span> Customers </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a
									href="${pageContext.request.contextPath}/systems/customer/list">Customers
										List</a></li>
								<li><a
									href="${pageContext.request.contextPath}/systems/customer/addCustomer">Add
										Customer</a></li>
								<li><a
									href="${pageContext.request.contextPath}/systems/customer/editCustomer">Edit
										Customer</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="page-wrapper">
			<div class="content">
				<div class="row">
					<div class="col-sm-4 col-3">
						<h4 class="page-title">Customers</h4>
					</div>
					<div class="col-sm-8 col-9 text-right m-b-20">
						<button onclick="window.location.href='addCustomer';"
							class="btn btn btn-primary btn-rounded float-right">
							<i class="fa fa-plus"></i> Add Customer
						</button>
					</div>
				</div>
				<form:form action="search" method="GET">
					<div class="row filter-row align-right">
						<div class="col-sm-6 col-md-9">
							<div class="form-group form-focus">
								<label class="focus-label">Employee Name</label> <input
									type="text" name="theSearchName" class="form-control floating">
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<button type="submit" class="btn btn-success btn-block">
								Search <i class="fa fa-search fa-lg"></i>
							</button>
						</div>
					</div>
				</form:form>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table">
								<thead>
									<!-- construct a sort link for first name -->
									<c:url var="sortLinkFirstName" value="/systems/customer/list">
										<c:param name="sort"
											value="<%=Integer.toString(SortUtils.FIRST_NAME)%>" />
									</c:url>

									<!-- construct a sort link for last name -->
									<c:url var="sortLinkLastName" value="/systems/customer/list">
										<c:param name="sort"
											value="<%=Integer.toString(SortUtils.LAST_NAME)%>" />
									</c:url>

									<!-- construct a sort link for email -->
									<c:url var="sortLinkEmail" value="/systems/customer/list">
										<c:param name="sort"
											value="<%=Integer.toString(SortUtils.EMAIL)%>" />
									</c:url>
									<tr>
										<th><a href="${sortLinkFirstName}">First Name</a></th>
										<th><a href="${sortLinkLastName}">Last Name</a></th>
										<th><a href="${sortLinkEmail}">Email</a></th>
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="customer" items="${customers}">
										<c:url var="editLink" value="/systems/customer/editCustomer">
											<c:param name="customerId" value="${customer.id}">
											</c:param>
										</c:url>
										<c:url var="deleteLink"
											value="/systems/customer/deleteCustomer">
											<c:param name="customerId" value="${customer.id}">
											</c:param>
										</c:url>
										<tr>
											<td>${customer.firstName}</td>
											<td><img width="28" height="28"
												src="${pageContext.request.contextPath}/resources/img/user.jpg"
												class="rounded-circle m-r-5" alt="">${customer.lastName}</td>
											<td>${customer.email}</td>
											<td class="text-right">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"><i
														class="fa fa-ellipsis-v"></i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="${editLink}"><i
															class="fa fa-pencil m-r-5"></i> Edit</a>
														<!-- <a
															class="dropdown-item" href="${deleteLink}" data-toggle="modal"
															data-target="#delete_appointment"><i
															class="fa fa-trash-o m-r-5"></i> Delete</a> -->
														<a class="dropdown-item" onclick="sweet()"> <i
															class="fa fa-trash-o m-r-5"></i> Delete
														</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="notification-box">
				<div class="msg-sidebar notifications msg-noti">
					<div class="topnav-dropdown-header">
						<span>Messages</span>
					</div>
					<div class="drop-scroll msg-list-scroll" id="msg_list">
						<ul class="list-box">
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">R</span>
										</div>
										<div class="list-body">
											<span class="message-author">Richard Miles </span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item new-message">
										<div class="list-left">
											<span class="avatar">J</span>
										</div>
										<div class="list-body">
											<span class="message-author">John Doe</span> <span
												class="message-time">1 Aug</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">T</span>
										</div>
										<div class="list-body">
											<span class="message-author"> Tarah Shropshire </span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">M</span>
										</div>
										<div class="list-body">
											<span class="message-author">Mike Litorus</span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">C</span>
										</div>
										<div class="list-body">
											<span class="message-author"> Catherine Manseau </span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">D</span>
										</div>
										<div class="list-body">
											<span class="message-author"> Domenic Houston </span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">B</span>
										</div>
										<div class="list-body">
											<span class="message-author"> Buster Wigton </span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">R</span>
										</div>
										<div class="list-body">
											<span class="message-author"> Rolland Webber </span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">C</span>
										</div>
										<div class="list-body">
											<span class="message-author"> Claire Mapes </span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">M</span>
										</div>
										<div class="list-body">
											<span class="message-author">Melita Faucher</span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">J</span>
										</div>
										<div class="list-body">
											<span class="message-author">Jeffery Lalor</span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">L</span>
										</div>
										<div class="list-body">
											<span class="message-author">Loren Gatlin</span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
							<li><a href="chat.html">
									<div class="list-item">
										<div class="list-left">
											<span class="avatar">T</span>
										</div>
										<div class="list-body">
											<span class="message-author">Tarah Shropshire</span> <span
												class="message-time">12:28 AM</span>
											<div class="clearfix"></div>
											<span class="message-content">Lorem ipsum dolor sit
												amet, consectetur adipiscing</span>
										</div>
									</div>
							</a></li>
						</ul>
					</div>
					<div class="topnav-dropdown-footer">
						<a href="chat.html">See all messages</a>
					</div>
				</div>
			</div>
			<div id="delete_appointment" class="modal fade delete-modal"
				role="dialog">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-body text-center">
							<img
								src="${pageContext.request.contextPath}/resources/img/sent.png"
								alt="" width="50" height="46">
							<h3>Are you sure want to delete this Appointment?</h3>
							<div class="m-t-20">
								<a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</div>
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
	<script
		src="${pageContext.request.contextPath}/resources/js/sweetalert2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script>
		function sweet (){
			Swal.fire({
				  title: 'Are you sure?',
				  text: "You won't be able to revert this!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.isConfirmed) {
					  window.location.href='${deleteLink}'
				  }
				});
		}
	</script>
</body>


<!-- appointments23:20-->
</html>