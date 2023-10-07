<!DOCTYPE html>
<html>
<head>
    
    <style>
        body {
            font-family: "Times New Roman";
            background-image: url(https://images.pexels.com/photos/3178786/pexels-photo-3178786.jpeg?cs=srgb&dl=pexels-andrew-neel-3178786.jpg&fm=jpg);
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent black overlay */
            z-index: 1;
        }

        .container {
            position: relative;
            text-align: center;
            z-index: 2; /* Place the container above the overlay */
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .heading {
            font-size: 70px;
            font-weight: bold;
            margin-bottom: 30px;
            background: -webkit-linear-gradient(rgb(44, 46, 44), rgb(201, 207, 201));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .button {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            font-size: 20px;
            font-weight: bold;
            color: #dad2d2;
            cursor: pointer;
            text-decoration: none; 
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .id-card-button {
            background-image: linear-gradient(rgb(9, 49, 3), rgb(102, 102, 95));
            transition-delay: 0.2s;
        }

        .student-db-button {
            background-image: linear-gradient(rgb(9, 49, 3), rgb(102, 102, 95));
            transition-delay: 0.4s;
        }

        .teacher-db-button {
            background-image: linear-gradient(rgb(9, 49, 3), rgb(102, 102, 95));
            transition-delay: 0.6s;
        }

        .button:hover {
            box-shadow: rgb(12, 23, 16) 0 4px 8px, rgb(12, 23, 16)  0 7px 14px -3px,rgb(12, 23, 16)  0 -3px 0 inset;
            transform: translateY(-2px);
        }

        .button:active {
            box-shadow: rgb(12, 23, 16)  0 3px 7px inset;
            transform: translateY(2px);
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <div class="heading">Admin Dashboard</div>
        <a href="id-gen.jsp" class="button id-card-button">ID CARD</a>
        <a href="student-db.jsp" class="button student-db-button">STUDENT DB</a>
        <a href="teacher-db.jsp" class="button teacher-db-button">TEACHER DB</a>
    </div>
</body>
</html>
