<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="header.jsp" %>


<!-- Cart Overlay -->
<div class="cart-overlay"></div>

<!-- Page Banner Section Start -->
<div class="page-banner-section section">
    <div class="page-banner-wrap row row-0 d-flex align-items-center ">

        <!-- Page Banner -->
        <div class="col-lg-4 col-12 order-lg-2 d-flex align-items-center justify-content-center">
            <div class="page-banner">
                <h1>Checkout</h1>
                <p>similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita</p>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">Shop</a></li>
                        <li><a href="#">Checkout</a></li>
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

<!-- Checkout Page Start -->
<div class="page-section section mt-90 mb-30">
    <div class="container">
        <div class="row">
            <div class="col-12">
                
                <!-- Checkout Form s-->
                <form:form action="/checkout" class="checkout-form" modelAttribute="user">
                   <div class="row row-40">
                       
                       <div class="col-lg-7 mb-20">
                          
                           <!-- Billing Address -->
                           <div id="billing-form" class="mb-40">
                               <h4 class="checkout-title">Billing Address</h4>

                               <div class="row">

                                   <div class="col-md-6 col-12 mb-20">
                                       <label>Name*</label>
                                       <form:input type="text" path="name" placeholder="First Name"/>
                                   </div>

                                   <div class="col-md-6 col-12 mb-20">
                                       <label>Email*</label>
                                       <form:input type="text" path="email" placeholder="Email"/>
                                   </div>

                                   <div class="col-md-6 col-12 mb-20">
                                       <label>Address*</label>
                                       <form:input type="email" path="email" placeholder="Address"/>
                                   </div>

                                   <div class="col-md-6 col-12 mb-20">
                                       <label>Phone no*</label>
                                       <form:input type="text" path="phone" placeholder="Phone number"/>
                                   </div>

                               </div>

                           </div>
                        </div>
                       
                       <div class="col-lg-5">
                           <div class="row">
                               
                               <!-- Cart Total -->
                               <div class="col-12 mb-60">
                               
                                   <h4 class="checkout-title">Cart Total</h4>
                           
                                   <div class="checkout-cart-total">

                                       <h4>Product <span>Total</span></h4>
                                       
                                       <ul>
                                       		<c:forEach items="${sessionScope.myCartItems }" var="item">  
                                       			<li>${ item.value.product.name }  X ${ item.value.quantity } <span><fmt:formatNumber type="number" currencyCode="VND" value="${item.value.quantity * item.value.product.price}" /></span></li>
                                       		</c:forEach>
                                       </ul>
                                       
                                       <h4>Grand Total <span><fmt:formatNumber type = "number" currencyCode="VND"  value="${sessionScope.myCartTotal}" /></span></h4>
                                       
                                   </div>
                                   
                               </div>
                               
                               <!-- Payment Method -->
                               <div class="col-12 mb-60">
                                   <button type="submit" class="place-order">Place order</button>
                               </div>
                               
                           </div>
                       </div>
                       
                   </div>
                </form:form>
                
            </div>
        </div>
    </div>
</div>
<!-- Checkout Page End --> 

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
    <div class="container">s
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