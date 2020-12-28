<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="icon" href="images/logo original.jpg" type="image/jpg">

<link rel="stylesheet" href="css/bootstrap.min.css"><!-- bootstrap-CSS -->
<link rel="stylesheet" href="css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->


<link rel="stylesheet" href="css/font-awesome.min.css" />

<script src="https://kit.fontawesome.com/104328197b.js" crossorigin="anonymous"></script><!-- fontawesome-CSS -->


<link rel="stylesheet" href="css/menu_sideslide.css" type="text/css" media="all"><!-- Navigation-CSS -->

<!-- meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //meta tags -->

<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	





<!-- js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap-select.js"></script>
<script>
    $(document).ready(function () {
    var mySelect = $('#first-disabled2');

    $('#special').on('click', function () {
      mySelect.find('option:selected').prop('disabled', true);
      mySelect.selectpicker('refresh');
    });

    $('#special2').on('click', function () {
      mySelect.find('option:disabled').prop('disabled', false);
      mySelect.selectpicker('refresh');
    });

    $('#basic2').selectpicker({
      liveSearch: true,
      maxOptions: 1
    });
  });
</script>
<!-- language-select -->
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link href="css/jquery.uls.css" rel="stylesheet"/>
<link href="css/jquery.uls.grid.css" rel="stylesheet"/>
<link href="css/jquery.uls.lcd.css" rel="stylesheet"/>
<!-- Source -->
<script src="js/jquery.uls.data.js"></script>
<script src="js/jquery.uls.data.utils.js"></script>
<script src="js/jquery.uls.lcd.js"></script>
<script src="js/jquery.uls.languagefilter.js"></script>
<script src="js/jquery.uls.regionfilter.js"></script>
<script src="js/jquery.uls.core.js"></script>
<script>
			$( document ).ready( function() {
				$( '.uls-trigger' ).uls( {
					onSelect : function( language ) {
						var languageName = $.uls.data.getAutonym( language );
						$( '.uls-trigger' ).text( languageName );
					},
					quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] 
				} );
			} );
        </script>
       
</head>
<body>



    <!-- Navigation -->
		<div class="agiletopbar">
            <div class="wthreenavigation">
                <div class="menu-wrap">
                    <nav class="menu">
                        <div class="icon-list">
                        
                        
                            <a href="Product?p=mobile"><i class="fa fa-fw fa-mobile"></i><span>My Profile</span></a>
                            
                            <a href="/myorders.jsp"><i class="fa fa-fw fa-laptop"></i><span>My Orders</span></a>
                            
<!--                             <a href="Product?p=car"><i class="fa fa-fw fa-car"></i><span>Cars</span></a> -->
                            
<!--                             <a href="Product?p=bike"><i class="fa fa-fw fa-motorcycle"></i><span>Bikes</span></a> -->
                            
<!--                             <a href="Product?p=furniture"><i class="fa fa-fw fa-wheelchair"></i><span>Furnitures</span></a> -->
                            
<!--                             <a href="Product?p=pet"><i class="fa fa-fw fa-paw"></i><span>Pets</span></a> -->
                            
<!--                             <a href="Product?p=book"><i class="fa fa-fw fa-book"></i><span>Books, Sports & Hobbies</span></a> -->
                            
<!--                             <a href="Product?p=fashion"><i class="fa fa-fw fa-asterisk"></i><span>Fashion</span></a> -->
                            
<!--                             <a href="Product?p=kids"><i class="fa fa-fw fa-asterisk"></i><span>Kids</span></a> -->
                            
<!--                             <a href="Product?p=service"><i class="fa fa-fw fa-shield"></i><span>Services</span></a> -->
                            
<!--                             <a href="Product?p=jobs"><i class="fa fa-fw fa-at"></i><span>Jobs</span></a> -->
                            
<!--                             <a href="Product?p=realstate"><i class="fa fa-fw fa-home"></i><span>Real Estate</span></a> -->
                            
                            
                            
                        </div>
                    </nav>
                        <button class="close-button" id="close-button">Close Menu</button>
                </div>
                        <button class="menu-button" id="open-button"> </button>
            </div>
                <div class="clearfix"></div>
        </div>
            <!-- //Navigation -->





    <header>
		<div class="w3ls-header"><!--header-one--> 
		
			<div class="w3ls-header-right">
				<ul>
            
                    <li class="dropdown head-dpdn">
						<a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
				
					<li class="dropdown head-dpdn">
						<a href="signin1.jsp" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i> Log In</a>
					</li>
				
				
					<li class="dropdown head-dpdn">
						<a href="cartDetails.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i>Cart</a>
					</li>
					<li class="dropdown head-dpdn">
						<a href="#"><span class="active uls-trigger"><i class="fa fa-language" aria-hidden="true"></i>Languages</span></a>
					</li>
					<li class="dropdown head-dpdn">
						<div class="header-right">			
    
                        <!-- Large modal -->
			            <div class="agile-its-selectregion">
				            <button   class="btn btn-primary" data-toggle="modal" data-target="#myModal">
				            <i class="fa fa-globe" aria-hidden="true"></i>Select City</button>
					        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
						        <div class="modal-dialog modal-lg">
							        <div class="modal-content">

								        <div class="modal-header">
									       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									        <h4 class="modal-title" id="myModalLabel">Please Choose Your Location</h4>
                                        </div>
                                        
								        <div class="modal-body">
									        <form class="form-horizontal" action="#" method="get">
										        <div class="form-group">
											        <select id="basic2" class="show-tick form-control" multiple>
												        <optgroup label="Popular Cities">
													        <option selected style="display:none;color:#eee;">Select City</option>
													        <option>Mumbai</option>
													        <option>Delhi</option>
													        <option>Kolkata</option>
													        <option>Chennai</option>
													        <option>Bangalore</option>
                                                        </optgroup>											
                                                    </select>
										        </div>
									        </form>    
                                        </div>
                                        
							        </div>
						        </div>
					        </div>
			            </div>
                        </div>
                        
					</li>
				</ul>
			</div>
			
			<div class="clearfix"> </div> 
        </div>
        




		<div class="container">
			<div class="agile-its-header">

				<div class="logo">
					<h1><a href="index.jsp"><span>Apni</span>Dukaan</a></h1>
                </div>
                
				<div class="agileits_search">

					<form action="Search.jsp" method="get">
						<input name="Search" value="" type="text" placeholder="Search for product" required="required"/>
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
					
					<a class="post-w3layouts-ad" href="adminLogin.jsp">Admin Login</a>
                </div>	
                
				<div class="clearfix"></div>
			</div>
        </div>
        
    </header>
    




    <!-- Navigation-JavaScript -->
			<script src="js/classie.js"></script>
			<script src="js/main.js"></script>
		<!-- //Navigation-JavaScript -->


</body>
</html>