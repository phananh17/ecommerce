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
				<div class="card-header"><a class="btn btn-sm btn-secondary" href="${request.contextPath}/admin/product/create">Thêm mới</a></div>
				<div class="card-body">
					<table class="table table-striped" id="table1">
                                <thead>
									<tr>
										<th style="width: 11.7463%;">ID</th>
										<th style="width: 41.9342%;">Tên sản phẩm</th>
										<th  style="width: 18.794%;">Hình ảnh</th>
										<th  style="width: 18.794%;">Giá </th>
										<th  style="width: 18.794%;">Giá Giảm</th>
										<th  style="width: 41.9342%;">Mô tả</th>
										<th  style="width: 11.7463%;">Danh mục</th>
										<th  style="width: 11.7463%;">Trạng thái</th>
										<th ></th>
										
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${ page.getContent() }" var="p">
									<tr>
										<td>${p.id}</td>
										<td>${p.name}</td>
										<td>
										<img alt="" src="${p.image}" width="50">
										</td>
										<td><fmt:setLocale value="${pageContext.response.locale}"/>
										<fmt:formatNumber value="${ p.price }" type="currency" pattern="##,##0" currencyCode="VND"/></td>
										<td><fmt:setLocale value="${pageContext.response.locale}"/>
										<fmt:formatNumber value="${ p.sale_price }" type="currency" pattern="##,##0" currencyCode="VND"/></td>
										<td>${p.description }</td>
										<td>${p.category.name}</td>
										<td><c:choose>
											<c:when test="${ p.status == 1 }">
												<span class="badge bg-success">Hiển Thị</span>
											</c:when>
											<c:otherwise>
												 <span class="badge bg-danger">Ẩn</span>
											</c:otherwise>
										</c:choose>
										</td>
										<td class="text-right"><a
										href="${request.contextPath}/admin/product/${ p.id }/update"
										class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
										<a href="${request.contextPath}/admin/product/${ p.id }/delete"
										class="btn btn-danger btn-sm btn-delete" onClick="return alert('Bạn muốn xóa sản phẩm này không !')"><i
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