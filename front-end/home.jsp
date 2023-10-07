<style>
    .admin-button{
        background-color: rgb(207,181,59);
        color: rgb(255, 255, 255);
        border: none;
        height: 70px;
        width: 150px;
        border-radius: 10px;
        cursor: pointer;
        position: relative;
        margin: 20px ;
        font-size: 17px;
        box-shadow: 0px 10px 15px 5px rgb(212,175,55);
    }
    .admin-button:hover {
        box-shadow: rgb(153,101,21) 0 4px 8px, rgb(153,101,21) 0 7px 13px -3px, rgb(153,101,21) 0 -3px 0 inset;
        transform: translateY(-2px);
  }
  
  .admin-button:active {
    box-shadow: rgb(207,181,59) 0 3px 7px inset;
    transform: translateY(2px);
  }
  
    .staff-button{
        background-color: rgb(153,101,21);
        color: rgb(255, 255, 255);
        border: none;
        height: 70px;
        width: 150;
        border-radius: 10px;
        cursor: pointer;
        position: relative;
        margin: 20px;
        font-size: 17px;
        box-shadow: 0px 10px 15px 5px rgb(153,101,21);
    }
    .staff-button:hover {
    box-shadow: rgb(212,175,55) 0 4px 8px, rgb(212,175,55) 0 7px 13px -3px, rgb(212,175,55) 0 -3px 0 inset;
    transform: translateY(-2px);
  }
  
  .staff-button:active {
    box-shadow: rgb(207,181,59) 0 3px 7px inset;
    transform: translateY(2px);
  }
  
    .student-button{
        background-color: rgb(212,175,55);
        color: rgb(255, 255, 255);
        border: none;
        height: 70px;
        width: 150;
        font-size: 17px;
        border-radius: 10px;
        cursor: pointer;
        position: relative;
        margin: 20px;
        box-shadow: 0px 10px 15px 5px rgb(212,175,55);
        

    }
    .student-button:hover {
    box-shadow: rgb(153,101,21) 0 4px 8px, rgb(153,101,21) 0 7px 13px -3px, rgb(153,101,21) 0 -3px 0 inset;
    transform: translateY(-2px);
  }
  
  .student-button:active {
    box-shadow: rgb(153,101,21) 0 3px 7px inset;
    transform: translateY(2px);
  }
    html{ 
  background: url(https://img.freepik.com/free-vector/realistic-white-golden-geometric-background_79603-2032.jpg?w=1060&t=st=1689748700~exp=1689749300~hmac=d45c2cd19732f667d3f95bfb8342154c3d69f814d85578a2fa0efcd46186cd10) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
   }
   body{
    margin: 0;
    height: 100vh;
    display: flex;
    align-items: center;
    
   }
   .container{
    margin: auto ;
   }
   .admin-button, .staff-button, .student-button {
    font-family: "Lucida Console", "Courier New", monospace;
    left: 30px;
    }
    .heading{
        text-align: center;
        font-family: "Lucida Console", "Courier New", monospace;
        font-size: 24px;
        font-weight: bold;
        margin-top: 50px; 
        margin-bottom: 80px; 
        color: rgb(164, 112, 34);
        line-height: 1.2;
        text-shadow: 2px 2px #fedf77; 
    }
 
  </style>
  
  <body>  
  <div class="container">
    <div class="heading">STUDENT INFO<br>AND <br>ID CARD MANAGEMENT</div>
    <a href="admin-login.jsp" target="_blank" style="display: block;">
        <button class="admin-button">ADMIN LOGIN</button>
    </a>
    <a href="staff-login.jsp" target="_blank" style="display: block;">
    <button class="staff-button">STAFF LOGIN</button>
    </a>
    <a href="student-login.jsp" target="_blank" style="display: block;">
    <button class="student-button">STUDENT LOGIN</button>
    </a>
  </div>
  </body>
  
  
  
         
  
  