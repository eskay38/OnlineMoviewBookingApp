<%-- 
    Document   : index
    Created on : 02-Jun-2020, 6:57:33 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Movie Mania</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
         <!--<link rel = "stylesheet" type = "text/css" href = "myStyle.css" />-->
         <link rel = "stylesheet" type = "text/css" href = "main.css" />
         <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
         
         
    </head>
   
    <body >
        <jsp:include page="header.jsp"/>
        
        <main>
        <div class="container-fluid">
  
            <div class="row">
        <div class="col-xl">
        <div class="row">     
        <div class="span6" style="float: none; margin-bottom: 20px; padding-left: 100px; padding-left: 200px; font-family : 'Lobster'; background: rgba(0, 0, 0, 0.8); width: 100%;">
            <h1 style="font-size: 800%;">Movie Mania</h1>
            <h2 id="tagline">For the movie freak within you...</h2>
        </div>   
        </div>
        </div>
       
        </div>   
        </div>
        <div class="container-sm" id="text">
           <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
        <img src="proj_images/book.jpg" class="d-block w-100" alt="..." height="500px" width="200px">
    </div>
    <div class="carousel-item">
      <img src="proj_images/theatre.jpg" class="d-block w-100" alt="..." height="500px" width="200px">
    </div>
    <div class="carousel-item">
      <img src="proj_images/ticket2.jpg" class="d-block w-100" alt="..." height="500px" width="200px">   </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        </div>
    </main>
        <br><br>
        <jsp:include page="footer.jsp"/>
    </body>
    
    
</html>