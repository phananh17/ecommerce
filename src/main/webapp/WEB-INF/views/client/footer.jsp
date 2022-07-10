<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer Section Start -->
<div class="footer-section section bg-ivory">
   
    <!-- Footer Top Section Start -->
    <div class="footer-top-section section pt-90 pb-50">
        <div class="container">
           
            <!-- Footer Widget Start -->
            <div class="row">
                <div class="col mb-90">
                    <div class="footer-widget text-center">
                        <div class="footer-logo">
                            <img src="/client/assets/images/logo.png" alt="E&E - Electronics eCommerce Bootstrap4 HTML Template">
                            <img class="theme-dark" src="/client/assets/images/logo-light.png" alt="E&E - Electronics eCommerce Bootstrap4 HTML Template">
                        </div>
                        <p>Electronics product actual teachings of  he great explorer of the truth, the malder of human happiness. No one rejects</p>
                    </div>
                </div>
            </div><!-- Footer Widget End -->
            
            <div class="row">
                
                <!-- Footer Widget Start -->
                <div class="col-lg-3 col-md-6 col-12 mb-40">
                    <div class="footer-widget">
                       
                        <h4 class="widget-title">Thông tin liên lạc</h4>
                        
                        <p class="contact-info">
                            <span>Địa chỉ</span>
                            234 Hoàng Quốc Việt,Cổ Nhuế 1,Bắc Từ Liêm,Hà Nội                       </p>
                        
                        <p class="contact-info">
                            <span>SĐT</span>
                            <a href="tel:01234567890">01234 567 890</a>
                            <a href="tel:01234567891">01234 567 891</a>
                        </p>
                        
                        <p class="contact-info">
                            <span>Web</span>
                            <a href="mailto:info@example.com">info@example.com</a>
                            <a href="#">www.example.com</a>
                        </p>
                        
                    </div>
                </div><!-- Footer Widget End -->
                
                <!-- Footer Widget Start -->
                <div class="col-lg-3 col-md-6 col-12 mb-40">
                    <div class="footer-widget">
                       
                        <h4 class="widget-title">Chăm sóc khách hàng</h4>
                        
                        <ul class="link-widget">
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Đặc sắc</a></li>
                            <li><a href="#">Tài khoản của tôi</a></li>
                            <li><a href="#">Giỏ hàng</a></li>
                            <li><a href="#">Thah toán</a></li>
                            <li><a href="#">Yêu thích</a></li>
                            <li><a href="#">blog</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                        
                    </div>
                </div><!-- Footer Widget End -->
                
                <!-- Footer Widget Start -->
                <div class="col-lg-3 col-md-6 col-12 mb-40">
                    <div class="footer-widget">
                       
                        <h4 class="widget-title">Thông tin</h4>
                        
                        <ul class="link-widget">
                            <li><a href="#">Theo dõi đơn hàng</a></li>
                            <li><a href="#">Định vị cửa hàng</a></li>
                            <li><a href="#">Hỗ trợ trực tuyến</a></li>
                            <li><a href="#">Điều khoản & Điều kiện</a></li>
                            <li><a href="#">Thanh toán </a></li>
                            <li><a href="#">Vận chuyển  & Trả hàng</a></li>
                            <li><a href="#"> Phiếu quà tặng</a></li>
                            <li><a href="#">Phiếu giảm giá đặc biệt</a></li>
                        </ul>
                        
                    </div>
                </div><!-- Footer Widget End -->
                
                <!-- Footer Widget Start -->
                <div class="col-lg-3 col-md-6 col-12 mb-40">
                    <div class="footer-widget">
                       
                        <h4 class="widget-title">LATEST TWEET</h4>
                        
                        <div class="footer-tweet"></div>
                        
                    </div>
                </div><!-- Footer Widget End -->
                
            </div>
            
        </div>
    </div><!-- Footer Bottom Section Start -->
   
    <!-- Footer Bottom Section Start -->
    <div class="footer-bottom-section section">
        <div class="container">
            <div class="row">
                
                <!-- Footer Copyright -->
                <div class="col-lg-6 col-12">
                    <div class="footer-copyright"><p>&copy; Copyright, 2018 All Rights Reserved by <a href="https://freethemescloud.com/">Free themes Cloud</a></p></div>
                </div>
                
                <!-- Footer Payment Support -->
                <div class="col-lg-6 col-12">
                    <div class="footer-payments-image"><img src="/client/assets/images/payment-support.png" alt="Payment Support Image"></div>
                </div>
                
            </div>
        </div>
    </div><!-- Footer Bottom Section Start -->
    
</div><!-- Footer Section End -->

<!-- Popup Subscribe Section Start -->

<!-- JS
============================================ -->
<script>
</script>
<!-- jQuery JS -->
<script src="/client/assets/js/vendor/jquery-1.12.4.min.js"></script>
<!-- Popper JS -->
<script src="/client/assets/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="/client/assets/js/bootstrap.min.js"></script>
<!-- Plugins JS -->
<script src="/client/assets/js/plugins.js"></script>

<!-- Main JS -->
<script src="/client/assets/js/main.js"></script>
<script>
	$(document).ready(function(){
		const BASE_URL = "${pageContext.request.contextPath}";
		$(document).on("click", "a.add-to-cart", e => {
			e.preventDefault();
			let $this = e.target;
			let href = $($this).closest("a").attr("href");
			$.ajax({
				url: BASE_URL + href,
				type: "GET",
				success: res => {
					alert("Da them vao gio hang");
					$(".header-cart").load(window.location.href + " .header-cart>*");
					$(".mini-cart-products").load(window.location.href + " .mini-cart-products>*");
				}
			})
		});

		$(document).on("click", ".remove_item", e => {
			e.preventDefault();
			let $this = e.target;
			let href = $($this).closest("a").attr("href");
			$.ajax({
				url: BASE_URL + href,
				type: "GET",
				success: res => {
					$(".header-cart").load(window.location.href + " .header-cart>*");
					$(".mini-cart-products").load(window.location.href + " .mini-cart-products>*");
				}
			})
		})
	})
</script>
</body>

</html>