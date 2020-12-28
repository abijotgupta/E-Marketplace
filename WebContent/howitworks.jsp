<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
 <!DOCTYPE html>
<html lang="en">
<head>
<title>How It Works</title>
 <link rel="icon" href="images/logo original.jpg" type="image/jpg">
    
<link rel="stylesheet" href="css/bootstrap.min.css"><!-- bootstrap-CSS -->
<link rel="stylesheet" href="css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->
<link rel="stylesheet" href="css/font-awesome.min.css" /><!-- fontawesome-CSS -->
<link rel="stylesheet" href="css/menu_sideslide.css" type="text/css" media="all"><!-- Navigation-CSS -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	

</head>
<body>


<jsp:include page="header1.jsp"></jsp:include>

	<!-- How it works -->
		<div class="work-section">
			<div class="container">
				<h2 class="w3-head">How It Works</h2>
					<div class="work-section-head text-center">
						<p>Fast, easy and free to post an ad and you will find, what you are looking for.</p>
					</div>
					<div class="work-section-grids text-center">
						<div class="col-md-3 work-section-grid">
							<i class="fa fa-eye"></i>
							<h4>Find an item</h4>
							<span class="arrow2"><img src="images/arrow2.png" alt="" /></span>
						</div>
						<div class="col-md-3 work-section-grid">
							<i class="fa fa-phone"></i>
							<h4>Place the Order</h4>
							<span class="arrow1"><img src="images/arrow1.png" alt="" /></span>
						</div>
						<div class="col-md-3 work-section-grid">
							<i class="fa fa-money"></i>
							<h4>Make Transactions</h4>
						</div>
						<div class="clearfix"></div>
						<a class="work" href="Postad.html">Get start Now</a>
					</div>
				</div>
		</div>	
		<div class="happy-clients">
				<div class="container">
					<div class="happy-clients-head text-center wow fadeInRight" data-wow-delay="0.4s">
						<h3>Happy Clients</h3>
						<p>We are explain who is using our business solutions</p>
					</div>
					<div class="happy-clients-grids">
						<div class="col-md-6 happy-clients-grid wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_1.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">Darwin Michle, </a>Project manager</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-6 happy-clients-grid span_66 wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_2.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">Madam Elisabath, </a>Creative Director</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-6 happy-clients-grid wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_3.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">Clips arter, </a>Lipsum director</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-6 happy-clients-grid span_66 wow bounceIn" data-wow-delay="0.4s">
							<div class="client">
								<img src="images/client_4.jpg" alt="" />
							</div>
							<div class="client-info">
								<p><img src="images/open-quatation.jpg" class="open" alt="" />Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<img src="images/close-quatation.jpg" class="closeq" alt="" /></p>
								<h4><a href="#">zam cristafr,  </a>manager</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
	<!-- // How it works -->


	
	<jsp:include page="footer1.jsp"></jsp:include>
	
	
		<!-- Navigation-JavaScript -->
			<script src="js/classie.js"></script>
			<script src="js/main.js"></script>
		<!-- //Navigation-JavaScript -->
		<!-- here stars scrolling icon -->
			<script type="text/javascript">
				$(document).ready(function() {
					/*
						var defaults = {
						containerID: 'toTop', // fading element id
						containerHoverID: 'toTopHover', // fading element hover id
						scrollSpeed: 1200,
						easingType: 'linear' 
						};
					*/
										
					$().UItoTop({ easingType: 'easeOutQuart' });
										
					});
			</script>
			<!-- start-smoth-scrolling -->
			<script type="text/javascript" src="js/move-top.js"></script>
			<script type="text/javascript" src="js/easing.js"></script>
			<script type="text/javascript">
				jQuery(document).ready(function($) {
					$(".scroll").click(function(event){		
						event.preventDefault();
						$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
					});
				});
			</script>
			<!-- start-smoth-scrolling -->
		<!-- //here ends scrolling icon -->
</body>
</html>