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
					<a href="${request.contextPath}/admin/product">Quay lại</a>
				</div>
				<div class="card-body">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">SỬA SẢN PHẨM</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form:form action="" class="form form-horizontal"
									modelAttribute="product" method="post" enctype="multipart/form-data">
									<div class="form-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Tên Sản Phẩm</label>
													<form:input class="form-control" placeholder="..."
														path="name" />
													<form:errors path="name" cssClass="text-danger" />
												</div>
											</div>
										
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Giá</label>
													<form:input type="number" class="form-control" placeholder="...."
														path="price" />
													<form:errors path="price" cssClass="text-danger" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Giá Khuyến Mãi</label>
													<form:input type="number" class="form-control" placeholder="...."
														path="sale_price" />
													<form:errors path="sale_price" cssClass="text-danger" />
												</div>
											</div>
								
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Chọn Danh Mục</label>
													<br>
													
													<select class="form-select" id="basicSelect" name="category.id">
													    <c:forEach items="${categories}" var="cat">
													            <option ${ product.category.id == cat.id ? "selected" : "" } value="${cat.id}">${cat.name}</option>
													    </c:forEach>
													</select>
													<form:errors path="category.id" cssClass="text-danger"/>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Hình Ảnh</label>
													 <input type="file" name="upload" class="custom-file-input" id="customFile">
													 <img id="image_product" alt="" src="${product.image}" width="100">
													 
												</div>
											</div>
										
											
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Trạng Thái</label> 
													<form:select path="status" class="form-control">
														<option value="1">Hiển Thị</option>
														<option value="0">Ẩn</option>
													</form:select>
												</div>
											</div>					<div class="col-md-6">
												<div class="form-group">
													<label for="">Mô Tả</label>
													<form:textarea class="form-control" placeholder="...." path="description" rows="3"></form:textarea>
													<form:errors path="description" cssClass="text-danger"/>
												</div>
											</div>
											<div class="col-sm-12 d-flex justify-content-end">
												<button type="submit" class="btn btn-primary me-1 mb-1">Lưu</button>
												<button type="reset"
													class="btn btn-light-secondary me-1 mb-1">Làm Lại</button>
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$("#customFile").change(function(){
		let file = $(this)[0].files[0]
		let reader = new FileReader();
		reader.onload = function(e){
			$("#image_product").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
	});
</script>
<jsp:include page="../footer.jsp" />