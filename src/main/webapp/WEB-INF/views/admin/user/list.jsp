<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			<div class="card-header"><a class="btn btn-sm btn-secondary" href="${request.contextPath}/admin/user/create">Thêm mới</a></div>
				<div class="card-body">
					<table class="table table-striped" id="table1">
                                <thead>
									<tr>
										<th style="width: 11.7463%;">ID</th>
										<th  style="width: 11.7463%;">Tên</th>
										<th style="width: 41.9342%;">Tên Tài Khoản</th>
										<th  style="width: 18.794%;">Số Điện Thoại</th>
										<th  style="width: 18.794%;">Địa Chỉ </th>
										<th  style="width: 18.794%;">E-Mail</th>
										<th  style="width: 18.794%;">Vai Trò</th>
										<th ></th>
										
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${ page.getContent() }" var="u">
									<tr>
										<td>${u.id}</td>
										<td>${u.name}</td>
										<td>${u.username}</td>
										<td>${u.phone }</td>
										<td>${u.address }</td>
										<td>${u.email }</td>
										<td>${u.role.name }</td>
										<td class="text-right"><a
										href="${request.contextPath}/admin/user/${ u.id }/update"
										class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
										<a href="${request.contextPath}/admin/user/${ u.id }/delete"
										class="btn btn-danger btn-sm btn-delete" onClick="return alert('Bạn muốn xóa không !')"><i
											class="fa fa-trash"></i></a></td>
									</tr>
									</c:forEach>
								</tbody>
                            </table>
					
				</div>
			</div>
		</section>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<jsp:include page="../footer.jsp" />