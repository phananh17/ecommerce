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
                <h1>Product Details</h1>
                <p>similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita</p>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">Product Details</a></li>
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

<!-- Single Product Section Start -->
<div class="product-section section mt-90 mb-90">
    <div class="container">
        
        <div class="row mb-90">
                    
            <div class="col-lg-6 col-12 mb-50">

                <!-- Image -->
                <div class="single-product-image thumb-right">

                    <div class="tab-content">
                        <div id="single-image-1" class="tab-pane fade show active big-image-slider">
                            <div class="big-image"><img src="${prod.image}" alt="Big Image"><a href="" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                            <div class="big-image"><img src="/client/assets/images/single-product/big-2.png" alt="Big Image"><a href="/client/assets/images/single-product/big-2.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                            <div class="big-image"><img src="/client/assets/images/single-product/big-3.png" alt="Big Image"><a href="/client/assets/images/single-product/big-3.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                        </div>
                        <div id="single-image-2" class="tab-pane fade big-image-slider">
                            <div class="big-image"><img src="/client/assets/images/single-product/big-7.png" alt="Big Image"><a href="/client/assets/images/single-product/big-7.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                            <div class="big-image"><img src="/client/assets/images/single-product/big-8.png" alt="Big Image"><a href="/client/assets/images/single-product/big-9.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                            <div class="big-image"><img src="/client/assets/images/single-product/big-9.png" alt="Big Image"><a href="/client/assets/images/single-product/big-9.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                        </div>
                        <div id="single-image-3" class="tab-pane fade big-image-slider">
                            <div class="big-image"><img src="/client/assets/images/single-product/big-13.png" alt="Big Image"><a href="/client/assets/images/single-product/big-13.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                            <div class="big-image"><img src="/client/assets/images/single-product/big-14.png" alt="Big Image"><a href="/client/assets/images/single-product/big-14.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                            <div class="big-image"><img src="/client/assets/images/single-product/big-15.png" alt="Big Image"><a href="/client/assets/images/single-product/big-15.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a></div>
                        </div>
                    </div>
                    
                    <div class="thumb-image-slider nav" data-vertical="true">
                        <a class="thumb-image active" data-toggle="tab" href="#single-image-1"><img src="/client/assets/images/single-product/thumb-1.png" alt="Thumbnail Image"></a>
                        <a class="thumb-image" data-toggle="tab" href="#single-image-2"><img src="/client/assets/images/single-product/thumb-2.png" alt="Thumbnail Image"></a>
                        <a class="thumb-image" data-toggle="tab" href="#single-image-3"><img src="/client/assets/images/single-product/thumb-3.png" alt="Thumbnail Image"></a>
                    </div>

                </div>

            </div>
                    
            <div class="col-lg-6 col-12 mb-50">

                <!-- Content -->
                <div class="single-product-content">

                    <!-- Category & Title -->
                    <div class="head-content">

                        <div class="category-title">
                            <a href="#" class="cat">${prod.category.name }</a>
                            <h5 class="title">${prod.name }</h5>
                        </div>

                        <h5 class="price"><fmt:formatNumber type = "number" 
         maxFractionDigits = "3" value = "${prod.price}" />đ</h5>

                    </div>

                    <div class="single-product-description">

                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>

                        <div class="desc">
                            <p>${prod.description }</p>
                        </div>
                        
                        <span class="availability">Availability: <span>${prod.status }</span></span>
                        
                        <div class="quantity-colors">
                            
                            <div class="quantity">
                                <h5>Quantity</h5>
                                <div class="pro-qty"><input type="text" value="1"></div>
                            </div>                            
                            
                                                     
                            
                        </div> 

                        <div class="actions">

                            <a href="/cart/add/${prod.id}" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>

                            <div class="wishlist-compare">
                                <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                            </div>

                        </div>
                        
                        <div class="tags">
                            
                            <h5>Tags:</h5>
                            <a href="#">Electronic</a>
                            <a href="#">Smartphone</a>
                            <a href="#">Phone</a>
                            <a href="#">Charger</a>
                            <a href="#">Powerbank</a>
                            
                        </div>
                        
                        <div class="share">
                            
                            <h5>Share: </h5>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            
                        </div>

                    </div>

                </div>

            </div>
            
        </div>
        
        <div class="row">
            
            <div class="col-lg-10 col-12 ml-auto mr-auto">
                
                <ul class="single-product-tab-list nav">
                    <li><a href="#product-description" class="active" data-toggle="tab" >description</a></li>
                    <li><a href="#product-specifications" data-toggle="tab" >specifications</a></li>
                    <li><a href="#product-reviews" data-toggle="tab" >reviews</a></li>
                </ul>
                
                <div class="single-product-tab-content tab-content">
                    <div class="tab-pane fade show active" id="product-description">
                        
                        <div class="row">
                            <div class="single-product-description-content col-lg-8 col-12">
                                <h4>Introducing Flex 3310</h4>
                                <p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora in</p>
                                <h4>Stylish Design</h4>
                                <p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
                                <h4>Digital Camera, FM Radio & many more...</h4>
                                <p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
                            </div>
                            <div class="single-product-description-image col-lg-4 col-12">
                                <img src="/client/assets/images/single-product/description.png" alt="description">
                            </div>
                        </div>
                        
                    </div>
                    <div class="tab-pane fade" id="product-specifications">
                        <div class="single-product-specification">
                            <ul>
                                <li>Full HD Camcorder</li>
                                <li>Dual Video Recording</li>
                                <li>X type battery operation</li>
                                <li>Full HD Camcorder</li>
                                <li>Dual Video Recording</li>
                                <li>X type battery operation</li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="product-reviews">
                       
                        <div class="product-ratting-wrap">
							<div class="pro-avg-ratting">
								<h4>4.5 <span>(Overall)</span></h4>
								<span>Based on 9 Comments</span>
							</div>
							<div class="ratting-list">
								<div class="sin-list float-left">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<span>(5)</span>
								</div>
								<div class="sin-list float-left">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
									<span>(3)</span>
								</div>
								<div class="sin-list float-left">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<span>(1)</span>
								</div>
								<div class="sin-list float-left">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<span>(0)</span>
								</div>
								<div class="sin-list float-left">
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<span>(0)</span>
								</div>
							</div>
							<div class="rattings-wrapper">
							
								<div class="sin-rattings">
									<div class="ratting-author">
										<h3>Cristopher Lee</h3>
                                        <div class="ratting-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <span>(5)</span>
                                        </div>
									</div>
									<p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
								</div>
								
								<div class="sin-rattings">
									<div class="ratting-author">
										<h3>Nirob Khan</h3>
                                        <div class="ratting-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <span>(5)</span>
                                        </div>
									</div>
									<p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
								</div>
								
								<div class="sin-rattings">
									<div class="ratting-author">
										<h3>MD.ZENAUL ISLAM</h3>
                                        <div class="ratting-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <span>(5)</span>
                                        </div>
									</div>
									<p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
								</div>
								
							</div>
							<div class="ratting-form-wrapper fix">
								<h3>Add your Comments</h3>
								<form action="#">
								    <div class="ratting-form row">
										<div class="col-12 mb-15">
											<h5>Rating:</h5>
											<div class="ratting-star fix">
												<i class="fa fa-star-o"></i>
												<i class="fa fa-star-o"></i>
												<i class="fa fa-star-o"></i>
												<i class="fa fa-star-o"></i>
												<i class="fa fa-star-o"></i>
											</div>
										</div>
										<div class="col-md-6 col-12 mb-15">
                                            <label for="name">Name:</label>
                                            <input id="name" placeholder="Name" type="text">
										</div>
										<div class="col-md-6 col-12 mb-15">
                                            <label for="email">Email:</label>
                                            <input id="email" placeholder="Email" type="text">
										</div>
										<div class="col-12 mb-15">
											<label for="your-review">Your Review:</label>
											<textarea name="review" id="your-review" placeholder="Write a review"></textarea>
										</div>
										<div class="col-12">
											<input value="add review" type="submit">
										</div>
								    </div>
								</form>
							</div>
						</div>
                        
                    </div>
                </div>
                
            </div>
            
        </div>
        
    </div>
</div><!-- Single Product Section End -->

<!-- Related Product Section Start -->
<div class="product-section section mb-70">
    <div class="container">
        <div class="row">
            
            <!-- Section Title Start -->
            <div class="col-12 mb-40">
                <div class="section-title-one" data-title="RELATED PRODUCT"><h1>RELATED PRODUCT</h1></div>
            </div><!-- Section Title End -->
            
            <!-- Product Tab Content Start -->
            <div class="col-12">
                        
                <!-- Product Slider Wrap Start -->
                <div class="product-slider-wrap product-slider-arrow-one">
                    <!-- Product Slider Start -->
                    <div class="product-slider product-slider-4">
						<c:forEach items="${pro}" var="p">
                        <div class="col pb-20 pt-10">
                            <!-- Product Start -->
                            <div class="ee-product">

                                <!-- Image -->
                                <div class="image">

                                    <a href="/product-detail" class="img"><img src="${p.image }" alt="Product Image"></a>

                                    <div class="wishlist-compare">
                                        <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                        <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                    </div>

                                    <a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>

                                </div>

                                <!-- Content -->
                                <div class="content">

                                    <!-- Category & Title -->
                                    <div class="category-title">

                                        <a href="#" class="cat">${p.category.name }</a>
                                        <h5 class="title"><a href="/product-detail">${p.name }</a></h5>

                                    </div>

                                    <!-- Price & Ratting -->
                                    <div class="price-ratting">

                                        <h5 class="price"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${p.price}" /></h5>
                                        <div class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>

                                    </div>

                                </div>

                            </div><!-- Product End -->
                        </div>
					</c:forEach>
                    </div><!-- Product Slider End -->
                </div><!-- Product Slider Wrap End -->
                        
            </div><!-- Product Tab Content End -->
            
        </div>
    </div>
</div><!-- Related Product Section End -->

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