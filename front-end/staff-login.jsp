<!DOCTYPE html>

<head>
  <meta charset="UTF-8">
  
  <link rel="stylesheet" type="text/css" href="style1.css">

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
	<form action="StaffLogin" method="post">
<div class="box-form">
	<div class="left">
		<div class="overlay">
		<h1>WELCOME BACK!</h1>
		<h2>HAVE A GREAT DAY AT WORK</h2>
		</div>
	</div>
		<div class="right">
		<h5>Login</h5>
		<div class="inputs">
			<input type="email" name ="mail" placeholder="gmail" required>
			<br>
			<input type="password" name ="pass" placeholder="password" required>
		</div>
			<br><br><br>
			<a href="dash-board.jsp" target="_blank">
				<button type="submit">Login</button>
				</a>
	</div>	
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
