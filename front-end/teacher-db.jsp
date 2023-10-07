<!DOCTYPE html>
<html>
<head>
    
    <style>
        
        body {
            font-family: "Comic Sans MS", cursive, sans-serif;
            background-image: url(https://images.pexels.com/photos/4194857/pexels-photo-4194857.jpeg?auto=compress&cs=tinysrgb&w=600);
            
            background-size: cover;
            margin: 0;
            padding: 0;
            
            
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-image: linear-gradient(rgb(236, 233, 231),rgb(77, 74, 74));
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease-out forwards;
        }
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .form-group {
            margin-bottom: 15px;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease-out forwards;
            animation-delay: 0.2s;
        }
        .form-group:last-child {
            animation-delay: 0.4s;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 70%; /* Reduce the width to 50% */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 16px;
            font-family: "Comic Sans MS", cursive, sans-serif;
        }
        
        .form-button {
            margin-top: 20px;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease-out forwards;
            animation-delay: 0.4s;
            
        }
        .form-group textarea {
            
            resize: vertical;
            
        }
        .form-button input {
            padding: 10px 20px;
            background-color: #e0e0df;
            color: #272525;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            font-family: "Comic Sans MS", cursive, sans-serif;
        }
        .form-button input:hover {
            box-shadow: rgb(35, 34, 34)  0 4px 8px, rgb(35, 34, 34)  0 7px 14px -3px,rgb(35, 34, 34)  0 -3px 0 inset;
            transform: translateY(-2px);
        }
        .form-button input:active{
    box-shadow: rgb(35, 34, 34)  0 3px 7px inset;
    transform: translateY(2px);
  }
    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
    <div class="container">
        <h1>Teacher DB</h1>
        <form action="AddStaff" method="post">
            <div class="form-group">
                <label for="unique-id">Unique ID:</label>
                <input type="text" id="unique-id" name="uniqueid" required>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="dept">Department:</label>
                <input type="text" id="dept" name="dept">
            </div>
            <div class="form-group">
                <label for="mail">Mail ID:</label>
                <input type="text" id="mail" name="mail">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="text" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="operation">Operation:</label>
                <select id="operation" name="operation">
                    <option value="insert">Insert</option>
                    <option value="delete">Delete</option>
                </select>
            </div>
            <div class="form-button">
                <input type="submit" name="button" value="Submit">
            </div>
        </form>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status == "success"){
	swal("operation done successfully !");
}
else if(status=="doesnotexist"){
	swal("sorry,operation failed.No such uniqueID exists");
}
else if(status=="exist"){
	swal("sorry,operation failed.UniqueID exists");
}
else if(status=="failed"){
	swal("sorry,operation failed.");
}

</script>
</body>
</html>
