<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/header.jsp" %>
<head>
	
	<title>비트코인 플랫폼 개발중</title>
	
	<!-- 비트코인 css -->
	
	<!--<link rel="stylesheet" type="text/css" href="/../../resources/css/ks/common.css" />-->
	<link rel="stylesheet" type="text/css" href="../../resources/css/ks/main.css" />
	<link rel="stylesheet" type="text/css" href="../../resources/css/index.css" />
	
	<!-- 비트코인 css끝 -->
	
	<!-- 비트코인 부분 -->
	<script src="../../resources/js/jquery.tubular.1.0.js"></script>
	<script src="../../resources/js/jquery.tubular.1.0.js"></script>
	<script src="https://code.highcharts.com/stock/highstock.js"></script>			<!-- 차트 API js -->
	<script src="../../resources/js/index_chart.js"></script>				<!-- 차트 구현 js -->
	<script src="../../resources/js/marketPrice_chart_customizing.js"></script>	<!-- 디자인 커스터마이징 js -->
	
    <!-- 비트코인 부분  끝 -->
    <script type="text/javascript" src="../../resources/js/skrollr.min.js"></script>
    <!--
	<script type="text/javascript" src="/resources/front/kr/js/plugin/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/front/kr/js/plugin/jquery.dotdotdot.min.js"></script>
	<script type="text/javascript" src="/resources/front/kr/js/plugin/skrollr.min.js"></script>
	<script type="text/javascript" src="/resources/front/kr/js/plugin/velocity.min.js"></script>

	<script type="text/javascript" src="/js/plugin/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="/js/plugin/jquery.mobile.custom.min.js"></script>

	<script type="text/javascript" src="/js/common_ui.js"></script>
	<script type="text/javascript" src="/js/main.js"></script> 
	-->
	
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		ga('create', 'UA-97845877-1', 'auto');
		ga('send', 'pageview');
	</script>
</head>

<body id="page-top">

	<!-- S : header -->


	<header>
	
		
		<!-- header image -->
		<div id="header-image">
			<!-- <img src="../../resources/img/main_bitcoin_img.png" alt="메인화면 콘텐츠" id="main_coin_img"/> -->
		</div>
	
		<!-- header content -->
		<div id="header-content">
			<!-- <img src="../../resources/img/main_typo.png" alt="메인화면 이미지" id="main_typo_img"/> -->
		</div>
		
		<!-- graph link img -->
		<div id="graph-link">
			<a href="/marketPrice"><img src="../../resources/img/graph_button.png" alt="graph-link" id="graph-link_img"/></a> 
		</div>
		
		<!-- news link img -->
		<div id="news-link">
			<a href="/news"><img src="../../resources/img/news_button.png" alt="news-link" id="news-link_img"/></a>
		</div>
			
		<!-- background -->
		<div id="wrapper">
			
			<!-- grand navigation -->
			<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	        	<div class="container">
	        
		            <div class="navbar-header">
		            
		                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
		                    <span class="sr-only">Toggle navigation</span> Menu 
		                </button>
		                
		                <a class="navbar-brand" href="/">
		                	<!-- <img id="main_logo_image" src="../../resources/img/140x56_BitRiver_black.png" alt="bitriver_logo" /> -->
		                </a>
		                
		            </div>
		
		            <div class="collapse navbar-collapse navbar-right">
		                <ul class="nav navbar-nav">
		                
		       	 			<li><a href="/marketPrice">시세</a></li>
							<li><a href="/news">비트코인뉴스</a></li>
							<li><a href="/sboard/list">비트코인커뮤니티</a></li>
							<li><a href="/sboard/list">딜러 소개</a></li>

		                </ul>
		            </div>
		            
		          <%@ include file="include/loginout.jsp" %> 	
	           
	      	 	</div> <!-- ./mainNav Container -->
			</nav> <!-- ./mainNav -->	
			
		</div> <!-- ./wrapper -->
		
		
	</header>
			<!-- 맨밑 하단부분과 가운데 부분 -->
			
			<!-- graph link img -->
		<div id="graph-link">
			<a href="/marketPrice"><img src="../../resources/img/graph_button.png" alt="graph-link" id="graph-link_img"/></a> 
		</div>
		
		<!-- news link img -->
		<div id="news-link">
			<a href="/news"><img src="../../resources/img/news_button.png" alt="news-link" id="news-link_img"/></a>
		</div>
			
			<!-- //Home -->
			<!-- On Air -->
			
		<!-- background -->
		<div id="wrapper">	
			
			
		<div id="bg-chart" class="section">
		
		<div class="col-md-offset-1 col-md-10 text-center">
		
		<h2 class="secTitle" data-bottom="opacity:0;transform:translate3d(-60px, 0px, 0px);" data-center-bottom="opacity:1;transform:translate3d(0px, 0px, 0px);">비트코인 시세 미리보기</h2>
			
			<div class="col-sm-12">
				<div id="USD_Bitcoin_info">USD / Bitcoin</div>
				<div id="USD_Bitcoin"></div>
			</div>
			<div class="col-lg-6">
				<div class="col-sm-6">	
					<div id="USD_Litecoin_info">USD / Litecoin</div>				
					<div id="USD_Litecoin"></div>
				</div>
				<div class="col-sm-6">
					<div id="USD_Ethereum_info">USD / Ethereum</div>				
					<div id="USD_Ethereum"></div>
				</div>
			</div>
			
			
			<div class="col-lg-6">
				<div class="col-sm-6">
					<div id="USD_Monero_info">USD / Monero</div>				
					<div id="USD_Monero"></div>
				</div>
				<div class="col-sm-6">
					<div id="USD_Factom_info">USD / Factom</div>				
					<div id="USD_Factom"></div>
				</div>
			</div>
			
		</div>
		
		
	</section>
			
			<!-- Works -->
			<div id="worksArea" class="section">
				<div class="frameSt" data-center-top="opacity:0;" data-bottom="opacity:1;"><span class="line"></span><span class="edge"></span></div>
				<h2 class="secTitle" data-bottom="opacity:0;transform:translate3d(-60px, 0px, 0px);" data-center-bottom="opacity:1;transform:translate3d(0px, 0px, 0px);">WORKS</h2>
				<div class="worksListWrap">
					<div class="leftSide">
						<ul>




								<li class="list01">
									<a href="http://www.studiodragon.net/front/kr/works/portfolio_view?class1=&cpage=2&idx=31" target="_self"><img src="http://images.studiodragon.net/upload/main/portfolio/9915220170607135410.jpg" alt="도깨비 이미지" /><strong class="worksOver"><span>도깨비</span></strong></a>
									<p>도깨비</p>
								</li>





								<li class="list02">
									<a href="http://www.studiodragon.net/front/kr/works/portfolio_view?idx=38&class1=" target="_self"><img src="http://images.studiodragon.net/upload/main/portfolio/1643220170607135841.jpg" alt="치즈인더트랩 이미지" /><strong class="worksOver"><span>치즈인더트랩</span></strong></a>
									<p>치즈인더트랩</p>
								</li>

						</ul>
					</div>
					<div class="rightSide">
						<ul>




								<li class="list03">
									<a href="http://www.studiodragon.net/front/kr/works/portfolio_view?idx=37&class1=" target="_self"><img src="http://images.studiodragon.net/upload/main/portfolio/2155020170607135855.jpg" alt="또 오해영 이미지" /><strong class="worksOver"><span>또 오해영</span></strong></a>
									<p>또 오해영</p>
								</li>





								<li class="list04">
									<a href="http://www.studiodragon.net/front/kr/works/portfolio_view?idx=39&class1=" target="_self"><img src="http://images.studiodragon.net/upload/main/portfolio/148720170607135902.jpg" alt="디어 마이 프렌즈 이미지" /><strong class="worksOver"><span>디어 마이 프렌즈</span></strong></a>
									<p>디어 마이 프렌즈</p>
								</li>





								<li class="list05">
									<a href="http://www.studiodragon.net/front/kr/works/portfolio_view?idx=34&class1=" target="_self"><img src="http://images.studiodragon.net/upload/main/portfolio/9706720170607135909.jpg" alt="THE K2 이미지" /><strong class="worksOver"><span>THE K2</span></strong></a>
									<p>THE K2</p>
								</li>

						</ul>
					</div>

				</div>
				<div class="btn-area"><a href="/front/kr/works/portfolio" class="btn more">VIEW MORE</a></div>
			</div>
			<!-- //Works -->
			<!-- issue -->
			<div id="issueArea" class="section"  style="background-image:url('http://images.studiodragon.net/upload/main/banner/3665120170607165042.jpg')">



					<a href="http://open.tving.com" target="_blank">

				<div class="frameSt"><span class="line"></span><span class="edge"></span></div>
				<dl class="txtArea" data-bottom-top="opacity:0;transform:translate3d(0px, 60px, 0px);" data-center-top="opacity:1;transform:translate3d(0px, 0px, 0px);">
					<dt>감독은 있는데 대본이 없다.</dt>
					<dd>작가를 꿈꾸는 이들에게 열려 있는 창작 공간과 기회를 제공합니다.</dd>
				</dl>

					</a>

			</div>
			<!-- //issue -->
			
		
			
			<!-- News -->
			<div id="newsArea" class="section">
				<h2 class="secTitle" data-bottom="opacity:0;transform:translate3d(-60px, 0px, 0px);" data-center-bottom="opacity:1;transform:translate3d(0px, 0px, 0px);">비트코인 NEWS</h2>
				<div class="tbl type2">
					<table>
						<caption>비트 코인 뉴스 목록</caption>
						<colgroup>
							<col /><col class="dateCell" />
						</colgroup>
						<tbody>

							<tr>
								<td class="tl"><a href="/front/kr/pr/news/61" class="txt">반전 장인‘써클’이 보여준 뒷통수 클래스</a></td>
								<td class="tr dateCell">2017.06.07</td>
							</tr>

							<tr>
								<td class="tl"><a href="/front/kr/pr/news/60" class="txt">‘하백의 신부 2017’ “난 수국의 왕 하백이다” 남주혁표 하백 베일 벗었다!</a></td>
								<td class="tr dateCell">2017.06.07</td>
							</tr>

							<tr>
								<td class="tl"><a href="/front/kr/pr/news/59" class="txt">tvN 화제작 ‘비밀의 숲’  시청자들과 함께 한 시사회, 후끈!</a></td>
								<td class="tr dateCell">2017.06.07</td>
							</tr>

							<tr>
								<td class="tl"><a href="/front/kr/pr/news/58" class="txt">OCN 복제인간 추격 스릴러‘듀얼’ 배우 양세종, 절대악 살인마 vs 기억 잃은 복제인간 1人 2色 대본 탐독 현장 포착!</a></td>
								<td class="tr dateCell">2017.06.07</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="btn-area"><a href="/front/kr/pr/news" class="btn more">VIEW MORE</a></div>
			</div>
			<!-- //News -->
			
			
			
			<div class="mainSideNavi home transit"><!-- 화면 상단일때 .home, 하단일때 .btm 추가 -->
				<ul>
					<li class="on"><a href="#page-top" class="transit">HOME</a></li>
					<li><a href="#bg-chart" class="transit">CHART</a></li>
					<li><a href="#worksArea" class="transit">WORKS</a></li>
					<li><a href="#issueArea" class="transit">ISSUE</a></li>
					<li><a href="#newsArea" class="transit">NEWS</a></li>
				</ul>
			</div>
		</div>
	</div>
	
		<section class="bg-third">
		
		<div class="container-fluid text-center">
			
			<!-- <div class="row"> -->
			<div id="box">
				
				<span id="email_title">매일 새로운 정보를 이메일로 구독하세요</span>
			
				<form role="form">
					<div class="col-sm-10">
						<div class="form-group">
							<input type="email" id="email" class="form-control" placeholder="이메일 주소를 입력해 주세요">
						</div>
					</div>
					<div class="col-sm-2">
						<input type="submit" class="btn btn-default" onclick="getEmail()" value="구독신청">
					</div>
				</form>				
			 
			</div>		
							
		</div>
		
	</section>
	

	<!-- E : container -->
	<script>
	$(document).ready(function(){
		loginCheck = "${empty login}"
		if(loginCheck == "true")
		{
			$('.navbar-nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
			$('.navbar-nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>');
	
		}
		else
		{
			$('.navbar-nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
			$('.navbar-nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
		}
		
	});
	</script>



     <script>
		$(document).ready(function() {
			var email = '<c:out value="${login.USER_EMAIL}"/>';
			if(email == "ksbang72@gmail.com")
			{
				var options = {	
						//videoId: 'H9P_wkq08XA', 
						videoId: 'fJIGGV_hWP4',
						start: 10
					};
			}
			else
			{
				var options = {
						videoId: 'Dk1tRGhQs_k', 
						//videoId: 'OdPgny2Q2js',
						start: 10
					};
			}
		
			$('#wrapper').tubular(options);
			
		});
	 </script> 

</body>

<%@ include file="include/footer.jsp" %>
