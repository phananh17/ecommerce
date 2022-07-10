<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <% if(session.getAttribute("admin") == null){
	request.getRequestDispatcher("/admin/login").forward(request, response);
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/admin/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/admin/assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="/admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="/admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/admin/assets/css/app.css">
    <link rel="shortcut icon" href="/admin/assets/images/favicon.svg" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
        <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/admin/assets/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <link rel="stylesheet" href="/admin/assets/vendors/simple-datatables/style.css">

    <link rel="shortcut icon" href="/admin/assets/images/favicon.svg" type="image/x-icon">
    <style type="text/css">
        .dataTable-dropdown label {
          display: none !important;
        }
        </style>
</head>

<body>

    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="${request.contextPath}/admin"><img src="/admin/assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-item  ">
                            <a href="<c:url value="admin/login" />" class="sidebar-link">
                               <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
                                <span>Đăng Xuất</span>
                            </a>
                        </li>
                        <li class="sidebar-title">Menu</li>
						<li class="sidebar-item active ">
                            <a href="${request.contextPath}/admin" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Trang chủ</span>
                            </a>
                        </li>
                     	
                       
                        <li class="sidebar-item  ">
                            <a href="${request.contextPath}/admin/category" class="sidebar-link">
                                <i class="fa fa-book" aria-hidden="true"></i>
                                <span>Danh mục sản phẩm</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="${request.contextPath}/admin/product" class="sidebar-link">
                               <i class="fa fa-superpowers" aria-hidden="true"></i>
                                <span>Sản Phẩm</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="${request.contextPath}/admin/orders" class="sidebar-link">
                               <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                                <span>Đơn Hàng</span>
                            </a>
                        </li>
                        
                        <li class="sidebar-item  ">
                            <a href="${request.contextPath}/admin/order_detail" class="sidebar-link">
                               <i class="fa fa-area-chart" aria-hidden="true"></i>
                                <span>Chi tiết đơn hàng</span>
                            </a>
                        </li>
                       
                        <li class="sidebar-item  ">
                            <a href="${request.contextPath}/admin/user" class="sidebar-link">
                               <i class="fa fa-address-book-o" aria-hidden="true"></i>
                                <span>Quản Trị Viên</span>
                            </a>
                        </li>
                        
                      </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        

            