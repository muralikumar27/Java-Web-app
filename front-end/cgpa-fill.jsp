<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CGPA Form</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
  <div class="container">
    <form action="InsertCgpa"id="cgpa-form" class="form" method="post">
      <label for="unique-id">Unique ID:</label>
      <input type="text" id="unique-id" name="uniqueid" required>
      <label for="cgpa">CGPA:</label>
      <input type="number" step="0.01" id="cgpa" name="cgpa" required>
      
      <button type="submit">Submit</button>
    </form>
  </div>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status == "success"){
	swal("update done successfully !");
}
else if(status=="failed"){
	swal("sorry,update failed");
}

</script>
</body>
</html>
