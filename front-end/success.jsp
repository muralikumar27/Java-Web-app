
<!DOCTYPE html>
<html>
<head>
   <style>
  /* Styling for overlay container */
  .overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
  }
  
  /* Styling for modal content */
  .modal {
    background-color: #fff;
    padding: 30px; /* Increase padding for more space inside */
    border-radius: 10px; /* Increase border radius for rounded corners */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
    max-width: 90%; /* Increase maximum width */
    max-height: 90%; /* Increase maximum height */
    overflow: auto;
    text-align: center; /* Center the text content */
  }
  
  /* Center the button horizontally and vertically */
  .center-button {
    display: flex;
    justify-content: center;
    align-items: center;
    position: fixed;
    width: 150px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 14px 40px;
    background-color:#788c96;
    color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
</style>
    <script>
    function openOverlay() {
        document.querySelector(".overlay").style.display = "flex";
      }

      // Function to close the overlay
      function closeOverlay() {
        document.querySelector(".overlay").style.display = "none";
      }
    </script>
</head>

    <body>
    <button onclick="openOverlay()" class="center-button" >Open Details</button>
    <!-- Overlay container -->
    <div class="overlay" onclick="closeOverlay()">
        <!-- Modal content -->
        <div class="modal">
            <h1>Student Details</h1>
            <h3>Welcome, <%= request.getAttribute("name") %></h3>
            <p>ID: <%= request.getAttribute("id") %></p>
            <p>Department: <%= request.getAttribute("department") %></p>
            <p>CGPA: <%= request.getAttribute("cgpa") %></p>
             <a href="DownloadDetails">Download</a>
        </div>
    </div>
</body>
</html>