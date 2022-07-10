<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="../header.jsp" />
<div id="main">
	<header class="mb-3">
		<a href="#" class="burger-btn d-block d-xl-none"> <i
			class="bi bi-justify fs-3"></i>
		</a>
	</header>

	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>DataTable</h3>
				</div>
				<div class="col-12 col-md-6 order-md-2 order-first">
					<nav aria-label="breadcrumb"
						class="breadcrumb-header float-start float-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
							<li class="breadcrumb-item active" aria-current="page">DataTable</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
		<section class="section">
			<div class="card">
				<div class="card-header">
					<a href="${request.contextPath}/admin/user">Quay lại</a>
				</div>
				<div class="card-body">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">THÊM MỚI</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form:form action="" class="form form-horizontal"
									modelAttribute="user" method="post"
									enctype="multipart/form-data">
									<div class="form-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Tên </label>
													<form:input class="form-control" placeholder="...."
														path="name" />
													<form:errors path="name" cssClass="text-danger" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Tên tài khoản</label>
													<form:input class="form-control" placeholder="..."
														path="username" />
													<form:errors path="username" cssClass="text-danger" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Số điện thoại</label>
													<form:input type="text" class="form-control"
														placeholder="098xxx" path="phone" />
													<form:errors path="phone" cssClass="text-danger" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Địa chỉ</label>
													<form:input class="form-control" placeholder="...."
														path="address" />
													<form:errors path="address" cssClass="text-danger" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">E-mail</label>
													<form:input type="email" class="form-control"
														placeholder="...." path="email" />
													<form:errors path="email" cssClass="text-danger" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Mật khẩu</label>
													<form:input type="password" class="form-control"
														placeholder="...." path="password" />
													<form:errors path="password" cssClass="text-danger" />
												</div>
											</div>
										</div>


										<div class="col-sm-12 d-flex justify-content-end">
											<button type="submit" class="btn btn-primary me-1 mb-1">Lưu</button>
											<button type="reset"
												class="btn btn-light-secondary me-1 mb-1">Làm Lại</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<jsp:include page="../footer.jsp" />