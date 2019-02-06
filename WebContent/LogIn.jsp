<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LogIn/Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Bitter|Coiny|Spicy+Rice" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="login.css">
</head>
<body>
<div class="img">
    <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up</h1>
          
          <form action="Nuser.jsp">
                     
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="reg_fname" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name
              </label>
              <input type="text" name="reg_lname" autocomplete="off"/>
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
              Set A Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
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
          <div class="course">
          <div class="field-wrap">
              <label>
                Course1
              </label>
              <input list="courses" name="course1" autocomplete="off" />
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
                Course2
              </label>
              <input list="courses" name="course2" autocomplete="off" />
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
                Course3
              </label>
              <input list="courses" name="course3" autocomplete="off" />
              <datalist id="courses">
    <option value="Engineering">
    <option value="Medical">
    <option value="Law">
    <option value="Management">
    <option value="Science">
  </datalist>
            </div>
            </div>
             <div class="field-wrap">
              <label>
                Highest Qualification<span class="req">*</span>
              </label>
              <input list="qual" name="qual" required autocomplete="off"/>
              
            </div>
          
          
          
          <button type="submit" class="button button-block" value="submit">Get Started</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="Ouser.jsp">
          
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
          <% 
try 
{
if(request.getAttribute("loginResult") != null && request.getAttribute("loginResult") == "true"){
%>
<div id="wrong">Wrong Combination of User name and Password!!!</div>
<%
}
}catch(Exception e)
{
    out.println(e.getLocalizedMessage());
}
%>
        
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script type="text/javascript">


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
</div>
</body>
</html>