<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="alustyle.css">
<title>ALUMNI</title>
</head>
<body style="font-family: 'Love Ya Like A Sister', cursive;">
<div class ="header">
<ul class="head">
  <li><a href="Home.html">HOME</a></li>
  <li class="dropdown">
  <span id="label">COURSES&nbsp;&nbsp;<i class="arrow down"></i></span>
  <div class="dropdown-content"></div>
</li>
  <li id="user"><button type="button" id="myBtn">LOGIN/REGISTER</button></li></ul>
   <!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          <form action="nuser.jsp">
                     
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="reg_fname" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="reg_lname" required autocomplete="off"/>
            </div>
          </div>

			 <div class="field-wrap">
              <label>
                User Name<span class="req">*</span>
              </label>
              <input type="text" name="user" required autocomplete="off" />
            </div>
            
          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="mail" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              LinkedIn Profile<span class="req">*</span>
            </label>
            <input type="url" name="profile" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
              <label>
                Course of Interest<span class="req">*</span>
              </label>
              <input list="courses" name="course" required autocomplete="off"/>
              <datalist id="courses">
    <option value="Engineering">
    <option value="Medical">
    <option value="Law">
    <option value="Management">
    <option value="Science">
  </datalist>
            </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block" value="submit">Get Started</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="ouser.jsp">
          
            <div class="field-wrap">
            <label>
              User Name<span class="req">*</span>
            </label>
            <input type="text" required name="l_user" autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" required name="l_pass" autocomplete="off"/>
          </div>
        
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  </div>

</div>

</div>
<div class='row'><div id="users" class="col-sm-3">
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
	String user=null;//(String)session.getAttribute("name");
	String course ="";
	Statement stat = con.createStatement();
	ResultSet rs=null, rs1=null;
	rs=stat.executeQuery("Select course from s_register where name='"+user+"'");
	if(rs.next()){
	course = rs.getString(1);
	%><script>
	var user = "<%=user %>";
	document.getElementById("user").innerHTML =  "<a href='#'>" + user + "</a>";
	</script>
	<%
	rs1=stat.executeQuery("Select * from alumni where course='"+course+"'");
	while(rs1.next())
	{
		String nm=rs1.getString(1);
		String cllg = rs1.getString(2);
		String prof=rs1.getString(4);
	%>
	<script>
		var div=document.getElementById("users");
		var nm="<%=nm %>";
		var cllg="<%=cllg%>";
		var lk="<%=prof%>";
		div.innerHTML+= "<div class='card'><div class='card-body'><h5 class='card-title'>"+nm+"</h5> <p class='card-text'>College: "+ cllg +"</p><a href='"+lk+"' target='_blank'><button class='myButt four'><span>Visit Profile</span></button></a></div></div>"; 
		</script>
</div></div> 
<%
	
}}
	}
catch(ClassNotFoundException e)
{
    out.println(e.getLocalizedMessage());
}
%>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript">
//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

// Changing between SignIn and SignUp
$('.form').find('input, textarea').on('keyup blur focus', function (e) {
	  
	  var $this = $(this),
	      label = $this.prev('label');

		  if (e.type === 'keyup') {
				if ($this.val() === '') {
	          label.removeClass('active highlight');
	        } else {
	          label.addClass('active highlight');
	        }
	    } else if (e.type === 'blur') {
	    	if( $this.val() === '' ) {
	    		label.removeClass('active highlight'); 
				} else {
			    label.removeClass('highlight');   
				}   
	    } else if (e.type === 'focus') {
	      
	      if( $this.val() === '' ) {
	    		label.removeClass('highlight'); 
				} 
	      else if( $this.val() !== '' ) {
			    label.addClass('highlight');
				}
	    }

	});

	$('.tab a').on('click', function (e) {
	  
	  e.preventDefault();
	  
	  $(this).parent().addClass('active');
	  $(this).parent().siblings().removeClass('active');
	  
	  target = $(this).attr('href');

	  $('.tab-content > div').not(target).hide();
	  
	  $(target).fadeIn(600);
	  
	});
</script>
</body>
</html>