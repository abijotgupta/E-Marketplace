<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin Sign Up</title>
         <link rel="icon" href="images/logo original.jpg" type="image/jpg">
    
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    
        <!-- Main css -->
       <link rel="stylesheet" href="css/signINsignUPstyle.css">
       
    </head>
    <body>
    
    <jsp:include page="header1.jsp"></jsp:include>
    
    
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Admin Sign up</h2>
                            <form action="${pageContext.request.contextPath}/adminregister" method="POST" class="register-form" id="register-form">
                            
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="name" id="name" placeholder="Your Name" required="required">
                                </div>
                                
                                <div class="form-group">
                                    <label for="number"><i class="zmdi zmdi-phone"></i></label>
                                    <input type="number" name="number" id="number" placeholder="Your Mobile Number" required="required">
                                </div>
                                
                                 <div class="form-group">
                                    <label for="dob"><i class="zmdi zmdi-calendar"></i></label>
                                    <input type="date" name="dob" id="dob" required="required">
                                </div>
                                
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Your Email" required="required">
                                </div>
                                
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" id="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" placeholder="Password" required="required">
                                </div>

                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" required="required">
                                </div>
                                
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                                
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="images/signup-image.jpg" alt="sign up image"></figure>
                            <a href="signin.html" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        
  <jsp:include page="footer1.jsp"></jsp:include>
        
    </body>
    </html>