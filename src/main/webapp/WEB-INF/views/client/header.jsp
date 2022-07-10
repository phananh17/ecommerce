<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>E&E</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/client/assets/images/favicon.ico">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/client/assets/css/bootstrap.min.css">
    
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="/client/assets/css/icon-font.min.css">
    
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="/client/assets/css/plugins.css">
    
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="/client/assets/css/style.css">
    
    <!-- Modernizer JS -->
    <script src="/client/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>

<!-- Header Section Start -->
<div class="header-section section">

    <!-- Header Top Start -->
    <div class="header-top header-top-one header-top-border pt-10 pb-10">
        <div class="container">
            <div class="row align-items-center justify-content-between">

                <div class="col mt-10 mb-10">
                    <!-- Header Links Start -->
                    <div class="header-links">
                        <a href="track-order.html"><img src="/client/assets/images/icons/car.png" alt="Car Icon"> <span>Theo dõi đơn hàng</span></a>
                        <a href="store.html"><img src="/client/assets/images/icons/marker.png" alt="Car Icon"> <span>Vị trí cửa hàng</span></a>
                    </div><!-- Header Links End -->
                </div>

                <div class="col order-12 order-xs-12 order-lg-2 mt-10 mb-10">
                    <!-- Header Advance Search Start -->
                    <div class="header-advance-search">
                        
                        <form action="#">
                            <div class="input"><input type="text" placeholder="Tìm kiếm ..."></div>
                            <div class="select">
                                <select class="nice-select">
                                    <option>Tất Cả Danh Mục</option>
                                    <c:forEach  items="${cate }" var="c">
                                    <option>${c.name}</option>
                                   </c:forEach>
                                </select>
                            </div>
                            <div class="submit"><button><i class="icofont icofont-search-alt-1"></i></button></div>
                        </form>
                        
                    </div><!-- Header Advance Search End -->
                </div>

                <div class="col order-2 order-xs-2 order-lg-12 mt-10 mb-10">
                    <!-- Header Account Links Start -->
                    <div class="header-account-links">
                    	<c:if test="${ sessionScope.user.username == null }">
                    		 <a href="/register"><i class="icofont icofont-user-alt-7"></i> <span>Đăng kí</span></a>
                        	<a href="/login"><i class="icofont icofont-login d-none"></i> <span>Đăng nhập</span></a>
                    	</c:if>
                       	<c:if test="${ sessionScope.user.username != null }">
                    		 <a href="#"><i class="icofont icofont-user-alt-7"></i> <span>${ sessionScope.user.username }</span></a>
                        	<a href="/logout"><i class="icofont icofont-login d-none"></i> <span>Đăng xuất</span></a>
                    	</c:if>
                    </div><!-- Header Account Links End -->
                </div>

            </div>
        </div>
    </div><!-- Header Top End -->

    <!-- Header Bottom Start -->
    <div class="header-bottom header-bottom-one header-sticky">
        <div class="container">
            <div class="row align-items-center justify-content-between">

                <div class="col mt-15 mb-15">
                    <!-- Logo Start -->
                    <div class="header-logo">
                        <a href="/">
                            <img  src="/client/assets/images/logo.png" alt="E&E ">
                            <img class="" src="/client/assets/images/logo-light.png" alt="E&E">
                        </a>
                    </div><!-- Logo End -->
                </div>

                <div class="col order-12 order-lg-2 order-xl-2 d-none d-lg-block">
                    <!-- Main Menu Start -->
                    <div class="main-menu">
                        <nav>
                            <ul>
                                <li class="active"><a href="/">Trang chủ</a></li>
                                <li><a href="/product-list">Sản phẩm</a>
                                </li>
                                <li class="menu-item-has-children"><a href="#">Trang</a>
                                    <ul class="mega-menu three-column">
                                        <li><a href="#">Column One</a>
                                            <ul>
                                                <li><a href="">About us</a></li>
                                                <li><a href="">Best Deals</a></li>
                                                <li><a href="">Cart</a></li>
                                                <li><a href="">Checkout</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Column Two</a>
                                            <ul>
                                                <li><a href="">Compare</a></li>
                                                <li><a href="faq.html">Faq</a></li>
                                                <li><a href="feature.html">Feature</a></li>
                                                <li><a href="/login">Login</a></li>
                                                <li><a href="/register">Register</a></li>
                                                <li><a href="/product-list">Product</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Column Three</a>
                                            <ul>
                                                <li><a href="terms-conditions.html">Terms & Conditions</a></li>
                                                <li><a href="track-order.html">Track Order</a></li>
                                                <li><a href="">Yêu thích</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="blog-1-column-left-sidebar.html">BLOG</a>
                                    <ul class="sub-menu">
                                        <li><a href="blog-1-column-left-sidebar.html">Blog 1 Column Left Sidebar</a></li>
                                        <li><a href="single-blog-left-sidebar.html">Single Blog Left Sidebar</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">CONTACT</a></li>
                            </ul>
                        </nav>
                    </div><!-- Main Menu End -->
                </div>

                <div class="col order-2 order-lg-12 order-xl-12">
                    <!-- Header Shop Links Start -->
                    <div class="header-shop-links">
                        
                        <!-- Compare -->
                        <a href="compare.html" class="header-compare"><i class="ti-control-shuffle"></i></a>
                        <!-- Wishlist -->
                        <a href="#" class="header-wishlist"><i class="ti-heart"></i> <span class="number"></span></a>
                        <!-- Cart -->
                        <a href="" class="header-cart"><i class="ti-shopping-cart"></i> <span class="number"><c:out value="${sessionScope.myCartNum }" /></span></a>
                    </div><!-- Header Shop Links End -->
                </div>
                
                <!-- Mobile Menu -->
                <div class="mobile-menu order-12 d-block d-lg-none col"></div>

            </div>
        </div>
    </div><!-- Header Bottom End -->

    <!-- Header Category Start -->
    <div class="header-category-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    
                    <!-- Header Category -->
                    <div class="header-category">
                        
                        <!-- Category Toggle Wrap -->
                        <div class="category-toggle-wrap d-block d-lg-none">
                            <!-- Category Toggle -->
                            <button class="category-toggle">Categories <i class="ti-menu"></i></button>
                        </div>
                        
                        <!-- Category Menu -->
                        <nav class="category-menu">
                            <ul>
                             <c:forEach items="${cate }" var="c">
                                <li><a href="#">${c.name }</a></li>
                                </c:forEach>
                            </ul>
                        </nav>
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </div><!-- Header Category End -->

</div><!-- Header Section End -->
<!-- Mini Cart Wrap Start -->                      
<div class="mini-cart-wrap">

    <!-- Mini Cart Top -->
    <div class="mini-cart-top">    
    
        <button class="close-cart">Close Cart<i class="icofont icofont-close"></i></button>
        
    </div>

    <!-- Mini Cart Products -->
    <ul class="mini-cart-products">
    <c:forEach var="map" items="${sessionScope.myCartItems }">
        <li>
            <a class="image"><img src="${map.value.product.image}" alt="Product"></a>
            <div class="content">
                <a  class="title" ><c:out value="${map.value.product.name}"/></a>
                <span class="price">Price: <fmt:formatNumber type = "number" 
         maxFractionDigits = "3"  value="${map.value.quantity * map.value.product.price }" />đ</span>
                <span class="qty">Quantity: <c:out value="${map.value.quantity}"/></span>
            </div>
            <button class="remove remove_item"><a href="/cart/remove/${map.value.product.id}"><i class="fa fa-trash-o"></i></a></button>
        </li>
     </c:forEach>
    </ul>

    <!-- Mini Cart Bottom -->
    <div class="mini-cart-bottom">    
<h4 align="center"><a href="/cart">View Cart</a></h4>
        <div class="button">
            <a href="/checkout">CHECK OUT</a>
        </div>
        
    </div>

</div><!-- Mini Cart Wrap End --> 