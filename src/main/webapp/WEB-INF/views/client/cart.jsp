 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp" %>


<!-- Cart Overlay -->
<div class="cart-overlay"></div>

<!-- Page Banner Section Start -->
<div class="page-banner-section section">
    <div class="page-banner-wrap row row-0 d-flex align-items-center ">

        <!-- Page Banner -->
        <div class="col-lg-4 col-12 order-lg-2 d-flex align-items-center justify-content-center">
            <div class="page-banner">
                <h1>Cart</h1>
                <p>similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita</p>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">Shop</a></li>
                        <li><a href="#">Cart</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Banner -->
        <div class="col-lg-4 col-md-6 col-12 order-lg-1">
            <div class="banner"><a href="#"><img src="/client/assets/images/banner/banner-15.jpg" alt="Banner"></a></div>
        </div>

        <!-- Banner -->
        <div class="col-lg-4 col-md-6 col-12 order-lg-3">
            <div class="banner"><a href="#"><img src="/client/assets/images/banner/banner-14.jpg" alt="Banner"></a></div>
        </div>

    </div>
</div><!-- Page Banner Section End -->

<!-- Cart Page Start -->
<div class="page-section section pt-90 pb-50 content-cart">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <form action="#">				
                    <!-- Cart Table -->
                    <div class="cart-table table-responsive mb-40">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="pro-thumbnail">Image</th>
                                    <th class="pro-title">Product</th>
                                    <th class="pro-price">Price</th>
                                    <th class="pro-quantity">Quantity</th>
                                    <th class="pro-subtotal">Total</th>
                                    <th class="pro-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.myCartItems }" var="item">                      
	                                <tr id="${item.value.product.id }">
	                                    <td class="pro-thumbnail"><a href="#"><img src="${item.value.product.image }" alt="Product"></a></td>
	                                    <td class="pro-title">${item.value.product.name }<a href="${item.value.product.name }"></a></td>
	                                    <td class="pro-price">
	                                    	<span><fmt:formatNumber type="number" currencyCode="VND" value="${item.value.product.price }" /></span></td>
	                                    <td class="pro-quantity">
		                                    <div class="pro-qty">                        				
		                                    	<input type="text" value="${item.value.quantity}" class="quantity" name="quantity">
		                                    </div>
	                                    </td>
	                                    <td class="pro-subtotal"><span><fmt:formatNumber type="number" currencyCode="VND" value="${item.value.quantity * item.value.product.price}" /></span></td>
	                                    <td class="pro-remove"><a href="/cart/remove/${item.value.product.id}"><i class="fa fa-trash-o"></i></a></td>
	                                </tr>                              
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                </form>	
                    
                <div class="row">

                    <div class="col-lg-6 col-12 mb-15">
                        <!-- Calculate Shipping -->
                        <div class="calculate-shipping">
                            <h4>Calculate Shipping</h4>
                            <form action="#">
                                <div class="row">
                                    <div class="col-md-6 col-12 mb-25">
                                        <select class="nice-select">
                                            <option>Bangladesh</option>
                                            <option>China</option>
                                            <option>country</option>
                                            <option>India</option>
                                            <option>Japan</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-12 mb-25">
                                        <select class="nice-select">
                                            <option>Dhaka</option>
                                            <option>Barisal</option>
                                            <option>Khulna</option>
                                            <option>Comilla</option>
                                            <option>Chittagong</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-12 mb-25">
                                        <input type="text" placeholder="Postcode / Zip">
                                    </div>
                                    <div class="col-md-6 col-12 mb-25">
                                        <input type="submit" value="Estimate">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Discount Coupon -->
                        <div class="discount-coupon">
                            <h4>Discount Coupon Code</h4>
                            <form action="#">
                                <div class="row">
                                    <div class="col-md-6 col-12 mb-25">
                                        <input type="text" placeholder="Coupon Code">
                                    </div>
                                    <div class="col-md-6 col-12 mb-25">
                                        <input type="submit" value="Apply Code">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Cart Summary -->
                    <div class="col-lg-6 col-12 mb-40 d-flex">
                        <div class="cart-summary">
                            <div class="cart-summary-wrap">
                                <h4>Cart Summary</h4>
                                <p>Sub Total <span><fmt:formatNumber type = "number" currencyCode="VND"  value="${sessionScope.myCartTotal}" /></span></p>
                                <h2>Grand Total <span><fmt:formatNumber type = "number" currencyCode="VND"  value="${sessionScope.myCartTotal}" /></span></h2>
                            </div>
                            <div class="cart-summary-button">
                                <button onclick="window.location.href = '${pageContext.request.contextPath}/checkout'" class="checkout-btn">Checkout</button>
                            </div>
                        </div>
                    </div>

                </div>
                
            </div>
        </div>
    </div>
</div>
<!-- Cart Page End --> 

<!-- Banner Section Start -->
<div class="banner-section section mb-90">
    <div class="container">
        <div class="row">
            
            <!-- Banner -->
            <div class="col-12">
                <div class="banner"><a href="#"><img src="/client/assets/images/banner/banner-10.jpg" alt="Banner"></a></div>
            </div>
            
        </div>
    </div>
</div><!-- Banner Section End -->

<!-- Brands Section Start -->
<div class="brands-section section mb-90">
    <div class="container">
        <div class="row">
            
            <!-- Brand Slider Start -->
            <div class="brand-slider col">
                <div class="brand-item col"><img src="/client/assets/images/brands/brand-1.png" alt="Brands"></div>
                <div class="brand-item col"><img src="/client/assets/images/brands/brand-2.png" alt="Brands"></div>
                <div class="brand-item col"><img src="/client/assets/images/brands/brand-3.png" alt="Brands"></div>
                <div class="brand-item col"><img src="/client/assets/images/brands/brand-4.png" alt="Brands"></div>
                <div class="brand-item col"><img src="/client/assets/images/brands/brand-5.png" alt="Brands"></div>
            </div><!-- Brand Slider End -->
            
        </div>
    </div>
</div><!-- Brands Section End -->

<!-- Subscribe Section Start -->
<div class="subscribe-section section bg-gray pt-55 pb-55">
    <div class="container">
        <div class="row align-items-center">
            
            <!-- Mailchimp Subscribe Content Start -->
            <div class="col-lg-6 col-12 mb-15 mt-15">
                <div class="subscribe-content">
                    <h2>SUBSCRIBE <span>OUR NEWSLETTER</span></h2>
                    <h2><span>TO GET LATEST</span> PRODUCT UPDATE</h2>
                </div>
            </div><!-- Mailchimp Subscribe Content End -->
            
            
            <!-- Mailchimp Subscribe Form Start -->
            <div class="col-lg-6 col-12 mb-15 mt-15">
                
				<form class="subscribe-form" action="#">
					<input type="email" autocomplete="off" placeholder="Enter your email here" />
					<button >subscribe</button>
				</form>
				<!-- mailchimp-alerts Start -->
				<div class="mailchimp-alerts text-centre">
					<div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
					<div class="mailchimp-success"></div><!-- mailchimp-success end -->
					<div class="mailchimp-error"></div><!-- mailchimp-error end -->
				</div><!-- mailchimp-alerts end -->
                
            </div><!-- Mailchimp Subscribe Form End -->
            
        </div>
    </div>
</div><!-- Subscribe Section End -->
<%@include file="footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		const BASE_URL = "${pageContext.request.contextPath}";
		$(document).on("click", ".dec", (e) => {
			let $this = e.target;
			let productId = $($this).closest("tr").attr("id");
			console.log("productId",productId);
			console.log("qty",BASE_URL);

			$.ajax({
				url: BASE_URL + "/cart/decrease/" + productId,
				type: "GET",
				success: res => {
					if(res == 200){
						location.reload();
					}
				}
			})
		});

		$(document).on("click", ".inc", (e) => {
			let $this = e.target;
			let productId = $($this).closest("tr").attr("id");
			console.log("productId",productId);
			console.log("qty",BASE_URL);

			$.ajax({
				url: BASE_URL + "/cart/increase/" + productId,
				type: "GET",
				success: res => {
					if(res == 200){
						location.reload();
					}
				}
			})
		});
	})
 </script>