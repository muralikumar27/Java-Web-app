<!DOCTYPE html>
<html lang="en" >
<head>

  <meta charset="UTF-8">
  
  <link rel="stylesheet" href="style3.css">

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
<!-- partial:index.partial.html -->
<div id="bg"></div>

<form action="StudentLogin" method="post" target="_blank">
  <div class="form-field">
    <input type="email" name= "mail" placeholder="Email" required/>
    
  </div>
  
  <div class="form-field">
    <input type="password" name="pass"placeholder="Password" required/>
    
  </div>
  
  <div class="form-field">
    <button class="btn" type="submit">Login</button>
  </div>
</form>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status == "failed"){
	swal("wrong email or password");
}</script>

  
</body>
</html>

