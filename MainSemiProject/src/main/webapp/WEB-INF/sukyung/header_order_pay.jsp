<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOSACOYA</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">    

<style type="text/css">

	span#navbar_page {
		display: inline-block;
		width: 28px;
		height: 28px;
		margin: 0 auto;
		border: solid 3px white;
		position: relative;
		top: 5px;
		background-color: #fdd007;
	}
	nav#nav_bar_order_pay {
		display: block;
		background-color: black;
		color: white;		
	} 

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("div.nav-group").hide();
		$("a#main_logo").hide();
		$("div#nav_bar_menu").hide();
		navView(); 	<%-- 네비바까지 스크롤했을때 네비게이션 addClass 함수--%>
		
		// 네비게이션 호버 이벤트
		$("a.header_nav_link").hover(function(e) {
							  $(e.target).css({"color":"#fdd007","font-weight":"bold"});
							  },
							  function(e) {
							  $(e.target).css({"color":"white","font-weight":"normal"});
		}) // end $("a.header_nav_link").hover
		
		
		// 구독버튼 호버이벤트
		$("div#email_submit_button").hover(function(e) {
										$("div#email_submit_button").html("SUBSCRIBE  <i class='fa-solid fa-arrow-right fa-fade' style='color: #000000;'></i>");
										}, function(e) {
										$("div#email_submit_button").html("SUBSCRIBE");
		}) // end $("div#email_submit_button").hover
	
		
		// 헤더 네비에 mouseover 시 메뉴 보여주는 이벤트
		$("#nav_bar_position > li a.header_nav_link").bind("mouseover", function(e){
			    
			$("div.nav-group").hide().css("opacity","0");
			const index = $("#nav_bar_position > li a.header_nav_link").index($(e.target));
			$("div.nav-group").eq(index).show().css("opacity","1");
			
			$("div#main_header").bind("mouseover", function(e){
				$("div.nav-group").hide().css("opacity","0");
			});
			$("div#body").bind("mouseover", function(e){
				$("div.nav-group").hide().css("opacity","0");
			});
		});
		
		
		
		
	}); // end $(document).ready
	
	function navView (){
		const header_nav_bar = document.getElementById("header_nav_bar");
		const nav_bar_Height = header_nav_bar.clientHeight;
	
		document.addEventListener('scroll', onScroll, {passive: true});
		
		function onScroll () {
			const scrollposition = pageYOffset; // 스크롤 위치
			
			if (nav_bar_Height <= scrollposition){ // 만약 헤더높이 <= 스크롤위치라면
				header_nav_bar.classList.add('nav_increment') //  nav_increment 클래스를 네비에 추가
				header_nav_bar.classList.add("animation-init");
				$("a#main_logo").fadeIn();
				$("div#nav_bar_menu").fadeIn();
				$("nav#nav_bar_circle").hide();
			}
			else { // 스크롤 안했을 때
				header_nav_bar.classList.remove('nav_increment'); // nav_increment 클래스를 네비에서 제거
				$("a#main_logo").fadeOut();
				$("div#nav_bar_menu").fadeOut();
				$("nav#nav_bar_circle").fadeIn();
			}
		}
	} // end function navView ()
	
	
	<%-- 구독하기 클릭했을때 해당 이메일로 쿠폰이 전송되는 함수 --%>
	function goSubscribe(){
		// 이메일 유효성 검사필요 툴팁으로 구현예정
		
	} // end function goSubscribe()
	

</script>

</head>

<body> 
<%-- 상단배너 시작 --%>
<header>
	<div id="main_header" class="container-fluid px-0">
		<div class="row text-center mx-5 py-4">
			<div id="header_bar" class="col md-3">
				<p><img src="https://cdn.shopify.com/s/files/1/2403/8187/files/PLANE.svg?v=1602619275"/></p>
				<p id="header_bar_font">FREE WORLDWIDE SHIPPING<p>
			</div>
			<div id="header_center" class="col md-3">
				<a id="header_home" href="#">
					<p id=header_logo class="mb-1">MOSACOYA</p>
					<p id=header_logo_subtitle>SSANGYONG&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;MADE BY TEAM 2&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;SINCE 2023</p>
				</a>
			</div>
			<div id="header_menu" class="col md-3">
				<img alt="Republic of Korea" class="mx-3" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" style="background-image: url(https://cdn.flow.io/util/icons/flags-v2/svg/iso_2_flags.svg); background-position: -46px -204px; width: 21px; height:15px; display: inline-block">
				<a href="#" style="color:black;" class="header-menu__link a1 mx-1" title="Login">Login</a>
				<a href="#"><i class="fa-solid fa-magnifying-glass mx-1" style="color: #000000;"></i></a>
				<a href="#"><i class="fa-solid fa-cart-shopping mx-1" style="color: #000000;"></i><span id="cart_count">0</span></a>
			</div>
		</div>
	</div>
</header>
<%-- 상단배너 끝 --%>
 
<%-- Sticky Navbar 시작 --%>
<nav id="header_nav_bar" class="navbar navbar-expand-sm sticky-top container-fluid py-0" style="display: block; height: 45px; background-color: black; color: white; animation-duration: 3s; animation-name: slidein; transition:transform 0.5s; /* 스크롤시 네비바 확대되는 속도 */">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#header_collapsibleNavbar">
		<span class="navbar-toggler-icon"><i class="fa-solid fa-list fa-xl" style="color: #ffffff;"></i></span>
	</button>	
	
	<div class="collapse navbar-collapse" id="header_collapsibleNavbar">
		<ul id="nav_bar_position" class="navbar-nav">
			<a id="main_logo" href="#">MOSACOYA</a>
			
			<li class="nav-item my-auto px-2">
				<a class="nav-link header_nav_link" href="<%= request.getContextPath()%>/shop/cartList.moc" style="font-size: 12pt; color: white;">장바구니</a>
			</li>
			<li class="nav-item my-auto px-2">
				<a class="nav-link header_nav_link" href="#" style="font-size: 12pt; color: white;">배송정보</a>
			</li>
			<li class="nav-item my-auto px-2">
				<a class="nav-link header_nav_link" href="#" style="font-size: 12pt; color: white;">결제하기</a>
			</li>
		</ul>
	<div id="nav_bar_menu" class="col md-3">
		<img alt="Republic of Korea" class="mx-3" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" style="background-image: url(https://cdn.flow.io/util/icons/flags-v2/svg/iso_2_flags.svg); background-position: -46px -204px; width: 21px; height:15px; display: inline-block">
		<a href="#" style="color:white; text-decoration: none;" class="header-menu__link a1 mx-1" title="Login">Login</a>
		<a href="#"><i class="fa-solid fa-magnifying-glass mx-1" style="color: #ffffff;"></i></a>
	</div>
</nav>
	<nav id="nav_bar_circle" class="navbar navbar-expand-sm sticky-top container-fluid py-0" style="display: block; height: 45px; background-color: black; color: white; animation-duration: 3s; animation-name: slidein; transition:transform 0.5s; /* 스크롤시 네비바 확대되는 속도 */">
	<ul class="navbar-nav justify-content-center">
    	<li class="nav-item">
	      	<div class="col mx-n2">
	      		<a href="<%= request.getContextPath()%>/shop/cartList.moc"><span id="navbar_page" class="rounded-circle"></span></a>
	      	</div>
		</li>
		<li class="nav-item my-auto">
	      	<div class="col-md-2 mx-n4">
				<hr style="border: solid 1px white; width: 70px;"> 
	      	</div>
		</li>
		<li class="nav-item my-auto">
	      	<div class="col mx-n2">
	      		<a href="#"><span id="navbar_page" class="rounded-circle"></span></a>
	      	</div>
		</li>
		<li class="nav-item my-auto">
	      	<div class="col-md-2 mx-n4">
				<hr style="border: solid 1px white; width: 70px;"> 
	      	</div>
		</li>
		<li class="nav-item my-auto">
	      	<div class="col mx-n2">
	      	<a href="#"><span id="navbar_page" class="rounded-circle" style="background-color: white;"></span></a>
	      	</div>
		</li>
	</ul>
	</nav>