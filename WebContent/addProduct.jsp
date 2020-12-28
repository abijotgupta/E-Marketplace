<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Add Products</title>
    
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    
        <!-- Main css -->
       <link type="text/css" rel="stylesheet" href="css/signINsignUPstyle.css">
    </head>
    <body>
    
    <jsp:include page="header1.jsp"></jsp:include>
    
    
        <div class="main">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Add Product</h2>
                            <form action="${pageContext.request.contextPath}/addProduct" method="POST" enctype="multipart/form-data" class="register-form" id="register-form">
                            
                                <div class="form-group">
                                    <label for="title"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="title" id="name" placeholder="Product Title"/>
                                </div>
                                
                                
                                <div class="form-group">
                                    <label for="metaTitle"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="metaTitle" id="name" placeholder="Product MetaTitle"/>
                                </div>
                                
                                
                                 <div class="form-group">
                                    <label for="slug"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="slug" id="name" placeholder="Product Slug"/>
                                </div>
                                
                                 <div class="form-group">
                                    <label for="summary"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="summary" id="name" placeholder="Product Summary"/>
                                </div>
                                
                                
                                 <div class="form-group">
                                    <label for="price"><i class="zmdi zmdi-phone"></i></label>
                                    <input type="number" name="price" id="number" placeholder="Enter Price"/>
                                </div>
                                
                                <div class="form-group">
                                    <label for="discount"><i class="zmdi zmdi-phone"></i></label>
                                    <input type="number" name="discount" id="number" placeholder="Enter Discount"/>
                                </div>
                                
                                <div class="form-group">
                                    <label for="quantity"><i class="zmdi zmdi-phone"></i></label>
                                    <input type="number" name="quantity" id="number" placeholder="Enter Quantity"/>
                                </div>
                                
                         
                         		<div class="form-group">
                                    <label for="shop"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="shop" id="name" placeholder="Enter Product Shop"/>
                                </div>
                                
                                
                                 <div class="form-group">
                                    <label for="img"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="file" name="img" id="name"/>
                                </div>
                               
                               
                               
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Add Product"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="images/signup-image.jpg" alt="sign up image"></figure>
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