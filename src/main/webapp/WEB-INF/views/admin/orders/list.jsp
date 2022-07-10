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
				<div class="card-body">
					<table class="table table-striped" id="table1">
                                <thead>
									<tr>
										<th style="width: 11.7463%;">Mã đơn hàng </th>
										<th style="width: 18.794%;">Mã người dùng</th>
										<th style="width: 18.794%;">Tên</th>
										<th  style="width: 41.9342%;">E-Mail </th>
										<th  style="width: 41.9342%;">Số ĐT </th>
										<th  style="width: 41.9342%;">Địa chỉ giao hàng </th>
										<th  style="width: 18.794%;">Ngày đặt hàng </th>
										<th  style="width: 18.794%;">Tình trạng đơn hàng </th>
										<th></th>
										
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${ page.getContent() }" var="o">
									<tr>
									<td>${od.order_id}</td>
										<td>${o.user_id}</td>										
										<td>${o.name}</td>
										<td>${o.email}</td>
										<td>${o.phone }</td>
										<td>${o.address }</td>
										<td>${o.created }</td>
										<td></td>
										<td class="text-right"><a
										href="${request.contextPath}/admin/orders/${ o.order_id }/update"
										class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
										<a href="${request.contextPath}/admin/orders/${ o.order_id }/delete"
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
 