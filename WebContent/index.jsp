<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="icon" href="images/logo original.jpg" type="image/jpg">


    <link href="https://fonts.googleapis.com/css?family=Montserrat|Ubuntu&display=swap" rel="stylesheet">
  
    <!-- CSS Stylesheets -->
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="css/signINsignUPstyle.css">
  
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/104328197b.js" crossorigin="anonymous"></script>
  
  
  <!-- Mobile-Friendly Test is an website to check your website is mobile friendly or not -->
  
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
</head>

<body>


		<jsp:include page="header1.jsp"></jsp:include>  
   
    	<section class="colored-section" id="testimonials">
        <div id="testimonial-carousel" class="carousel slide" data-ride="carousel">

            <ol class="carousel-indicators">
                <li data-target="#testimonial-carousel" data-slide-to="0" class="active"></li>
                <li data-target="#testimonial-carousel" data-slide-to="1"></li>
                <li data-target="#testimonial-carousel" data-slide-to="2"></li>
                <li data-target="#testimonial-carousel" data-slide-to="3"></li>
                <li data-target="#testimonial-carousel" data-slide-to="4"></li>
            </ol>

              <div class="carousel-inner" role="listbox">

                <div class="carousel-item active container-fluid" data-interval="1000">
                    <a href="viewProducts.jsp"><img class="testimonial-img d-block w-100" src="images/poco.jpg" alt="poco"></a>
                </div>
    
                <div class="carousel-item container-fluid" data-interval="1000">
                    <a href="viewProducts.jsp"><img class="testimonial-img d-block w-100" src="images/electronics.jpg" alt="electronics"></a>
                </div>

                <div class="carousel-item container-fluid" data-interval="1000">
                    <a href="viewProducts.jsp"><img class="testimonial-img d-block w-100" src="images/utensils.jpg" alt="utensils"></a>
                </div>

                <div class="carousel-item container-fluid" data-interval="1000">
                    <a href="viewProducts.jsp"><img class="testimonial-img d-block w-100" src="images/men fashion.jpg" alt="men fashion"></a>
                </div>

                <div class="carousel-item container-fluid" data-interval="1000">
                    <a href="viewProducts.jsp"><img class="testimonial-img d-block w-100" src="images/watch.jpg" alt="watch"></a>
                </div>
    		
    			
    			 <a class="left carousel-control" href="#testimonial-carousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
    
                <a class="right carousel-control" href="#testimonial-carousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
    			
            </div>
        </div>   
    </section> 
    
    
<!--     <div style="max-width:100%"> -->
<!--   <img class="mySlides"  src="images/poco.jpg" > -->
<!--   <img class="mySlides"  src="images/watch.jpg" > -->
<!-- </div> -->
<!-- <script> -->
// var myIndex = 0;
// carousel();

// function carousel() {
//     var i;
//     var x = document.getElementsByClassName("mySlides");
//     for (i = 0; i < x.length; i++) {
//        x[i].style.display = "none";  
//     }
//     myIndex++;
//     if (myIndex > x.length) {myIndex = 1}    
//     x[myIndex-1].style.display = "block";  
//     setTimeout(carousel, 2000); // Change image every 2 seconds
// }
<!-- </script> -->


	 <a href="viewProducts.jsp"><img src="/images/r.jpg" alt="watch"></a>


  <hr class="hr1">


    <section id="fashion">

        <h2>Explore Fashion Collection</h2>

        <div class="container-fluid">

            <div class="row">

                <div class="fashion-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/mens fashion.jpg"></a>
                    <h3>Men's Clothing</h3>
                </div>

                <div class="fashion-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/women fashion.jpg"></a>
                    <h3>Women's Clothing</h3>
                </div>

                <div class="fashion-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/mens footwear.jpg"></a>
                    <h3>Men's Footwear</h3>
                </div>

                <div class="fashion-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/smart watches.jpg"></a>
                    <h3>Smart Watches</h3>
                </div>

            </div>

        </div>

    </section>


    <hr class="hr1">

    <section id="mobile">

        <h2>Explore Mobiles and Tablets</h2>
        <div class="container-fluid">
			<div class="row">
                <div class="mobile-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/smart phone.jpg" alt="smartphones"></a>
                    <h3>Smartphones</h3>
                </div>

                <div class="mobile-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/keypad phones.jpg"  alt="keypad phones"></a>
                    <h3>Keypad Phones</h3>
                </div>

                <div class="mobile-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/taablets.jpg"  alt="Tablets"></a>
                    <h3>Tablets</h3>
                </div>

                <div class="mobile-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/Lenovo Tab P10 Tablet X 705L 4GB RAM 64GB 4G LTE Wi Fi Non Calling Aurora BlackB.jpg"  alt="Non-Calling"></a>
                    <h3>Non-Calling Tablets</h3>
                </div>
			</div>
		</div>

    </section>


    <hr class="hr1">
    
    <section id="gadzet">

        <h2>Gadzet Zone</h2>

        <div class="container-fluid">
			<div class="row">
				<div class="gadzet-box col-lg-3">
                    <a href="viewProducts.jsp"><img src="images/men fashion.jpg"  alt="Headphones"></a>
                    <h3>Headphones & Headsets</h3>
                    <h2>Starting &#8377 199</h2>
                </div>

                <div class="gadzet-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/1.jpg" alt="bluetooth"></a>
                    <h3>Bluetooth Speakers</h3>
                    <h2>Upto 25% Off</h2>
                </div>

                <div class="gadzet-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/smart watches.jpg" alt="mobile accessories"></a>
                    <h3>Mobile Accessories</h3>
                    <h2>Starting &#8377 49</h2>
                </div>

                <div class="gadzet-box col-lg-3">
                     <a href="viewProducts.jsp"><img src="images/watch.jpg" alt="storage devices"></a>
                    <h3>Storage Devices</h3>
                    <h2>Starting &#8377 299</h2>
                </div>
            </div>
        </div>

    </section>


<jsp:include page="footer1.jsp"></jsp:include>



</body>


</html>