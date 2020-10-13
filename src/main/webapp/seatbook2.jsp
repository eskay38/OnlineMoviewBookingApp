<%@page import = "java.util.ArrayList"%>
<%@page import= "com.mycompany.onlinemovies.show"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import = "com.mycompany.onlinemovies.fetchShows"%>
 <%@taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "myStyle.css" />
        <link rel = "stylesheet" type = "text/css" href = "main.css" />
        <title>Book Seat</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
    <body>
        <%
            String u_type = (String) session.getAttribute("user_type");
            if(u_type==null || u_type.equalsIgnoreCase("Guest"))
            {
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
            String mov = (String) session.getAttribute("movie");
            %>
            
            <%
            if(mov==null || mov.equals(""))
            {
                response.sendRedirect("welcome.jsp");
            }
            String id1 = (String) request.getParameter("showid");
            int id=0;
            if(id1==null || id1.equals(""))
            {
                response.sendRedirect("welcome.jsp");
            }
            else
            {
                id = Integer.parseInt(id1);
            }
            fetchShows s = new fetchShows(id); 
            
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
            
            session.setAttribute("uid",(""+id));
            show ws = s.ShowWatch();
            int g  = ws.getGoldSeats();
            int p  = ws.getPrimeSeats();
            int cl  = ws.getClassicSeats();
            
            
        %>
        <jsp:include page="header.jsp"/>
        <main>
        <br><br>
        <h1> Book your seat here </h1>
        <div class="container">
            <form action="bookticket"  method="POST">
              
            <div class="form-group">
                
                 <div class="row">
        <div class="span6" style="float: none; margin: 0 auto;">
            
                </div>
                 </div>
             
                <label>Seat Type</label>
                <select onchange="setPrice()" name="category" class="form-control" id="category">
                <option selected="" disabled="">---</option>
                <option >Gold</option>
                <option >Prime</option>
                <option >Classic</option>
            </select><br><br><br>
            <label>No. of seats</label> <br>
           
            <input type="button"  onclick="incrementValue()" value="+" class="btn btn-primary" />
            <input readonly="readonly" type="text" name="seats"  class="form-control" id="number" value="0" />
            <input type="button"  onclick="decrementValue()" value="-" class="btn btn-primary" /><br><br>
            
            <label>Price: </label>
            <input readonly="readonly" type="text" name="price"  class="form-control" id="price" value="0"><br><br>
            
            <button type="submit" class="btn-primary" value="Book Ticket">Confirm Booking</button>
            </div>
        </form>
        </div>
        </main>
        <jsp:include page="footer.jsp"/>
<script>
    

function setPrice(){
    
    
    var x = document.getElementById('category');
    var y = document.getElementById('price');
    var z = document.getElementById('number');
    var g = "Gold"; var p = "Prime"; var c = "Classic";
    
    if(x.value===g){
        y.value = z.value*120;
    }
    else if(x.value===p){
        y.value = z.value*100;
    }
    else if(x.value===c){
        y.value = z.value*75;
    }
    
    
    
}


document.getElementById('category').onchange(function(){
        var selectedVal = this.value;
        var selectedText = this.options[this.selectedIndex].text;
        
        var pr;
    var am;
    var cat  = document.getElementById('category').value;
    var value = parseInt(document.getElementById('price').value,10);
    value = isNaN(value) ? 0 : value;
    if(cat==="Gold"){
        lim = 40;
        am=120;
    }
    else if(cat==="Prime"){
        lim = 60;
        am=100;
    }
    else if(cat==="Classic"){
        lim = 20;
        am=75;
    }
    else
    {
        lim=0;
        am=0;
    }
    pr=am*value;
    
    
    
    document.getElementById('price').value = pr;
});




function incrementValue()
{
    var pr;
    var am;
    var cat  = document.getElementById('category').value;
    
    var value = parseInt(document.getElementById('number').value,10);
    value = isNaN(value) ? 0 : value;
    var lim;
    if(cat==="Gold"){
        lim = 40;
        am=120;
    }
    else if(cat==="Prime"){
        lim = 60;
        am=100;
    }
    else if(cat==="Classic"){
        lim = 20;
        am=75;
    }
    else
    {
        lim=0;
        am=0;
    }
    
    if(value<lim){
        value++;
    }
    else{
        value=lim;
        
    }
    
    pr=am*value;
    
    document.getElementById('number').value = value;
    document.getElementById('price').value = pr;
    
}


function decrementValue()
{
    var pr;
    var am;
    var cat  = document.getElementById('category').value;
    
    var value = parseInt(document.getElementById('number').value,10);
    value = isNaN(value) ? 0 : value;
    var lim;
    if(cat==="Gold"){
        lim = 40;
        am=120;
    }
    else if(cat==="Prime"){
        lim = 60;
        am=100;
    }
    else if(cat==="Classic"){
        lim = 20;
        am=75;
    }
    else
    {
        lim=0;
        am=0;
    }
    
    if(value>0)
    {
        value--;
    }
    else
    {
        value=0;
    }
    
    pr=am*value;
    
    document.getElementById('number').value = value;
    document.getElementById('price').value = pr;
}
    


</script>
    </body>
</html>