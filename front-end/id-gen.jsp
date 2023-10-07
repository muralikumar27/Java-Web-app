<!DOCTYPE html>
<html>
<head>
    
    <style>
        .download-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .download-button:hover {
            background-color: #0056b3;
        }
        body {
            font-family: "Comic Sans MS", cursive, sans-serif;
            background-image: url(https://wallpapercave.com/wp/wp12555544.jpg);
            background-position: center;
            background-size: cover;
            margin: 0;
            padding: 0;
            
            
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-image: linear-gradient(rgb(203, 103, 45), rgb(226, 32, 10));
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
            background-color: #e35711;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            font-family: "Comic Sans MS", cursive, sans-serif;
        }
        .form-button input:hover {
            box-shadow: rgb(203, 103, 45)  0 4px 8px, rgb(203, 103, 45)  0 7px 14px -3px,rgb(203, 103, 45)  0 -3px 0 inset;
            transform: translateY(-2px);
        }
        .form-button input:active{
    box-shadow: #de662be1  0 3px 7px inset;
    transform: translateY(2px);
  }
    </style>
</head>
<body>
    <div class="container">
        <h1>ID Form</h1>
        <form action="IdGen" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" >
            </div>
            <div class="form-group">
                <label for="name">ID:</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="dept">Department:</label>
                <input type="text" id="dept" name="dept" >
            </div>
            <div class="form-group">
                <label for="designation">Designation:</label>
                <input type="text" id="designation" name="designation" >
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="text" id="dob" name="dob" >
            </div>
            <div class="form-group">
                <label for="photo-url">Photo:</label>
                <input type="file" id="photo" name="photo" >
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="3" ></textarea>
            </div>
            <div class="form-button">
                <label for="operation">Operation:</label>
                <select id="operation" name="operation">
                    <option value="insert">Insert</option>
                    <option value="download">Download</option>
                    <option value="delete">Delete</option>
                </select>
                <input type="submit" value="Submit">
            </div>
        </form>
    </div>
</body>
</html>
