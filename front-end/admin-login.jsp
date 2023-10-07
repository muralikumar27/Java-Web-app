
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="style.css">
  
</head>
<body>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
<div class="box-form">
	<div class="left">
		<div class="overlay">
		<h1>HEY, ADMIN!</h1>
		<h2>HAVE A GREAT DAY AT WORK</h2>
		</div>
	</div>
	<div class="right">
		<h5>Login</h5>
		<form action="AdminLogin" method="post" >
			<div class="inputs">
				<input type="email" id="email" name="email" placeholder="Email" required>
				<br>
				<input type="password" id="password" name="password" placeholder="Password" required>
			</div>
			<br><br><br>
			<button type="submit">Login</button>
		</form>
	</div>
</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status == "failed"){
	swal("wrong email or password");
}</script>
</body>
</html>
