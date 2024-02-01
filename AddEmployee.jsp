<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.css" rel="stylesheet"/>
    <title>Add Employee</title>
</head>
<body id="">
	<jsp:directive.include file = "html_includes/HeaderAdmin.html" />


   
  
    <div class="container" style="margin-top:98px;">
    <div class="row">
      <div class="col-2"></div>
      <div class="col-8">
     <form name="formAdd" action="AddEmployeServlet" method="POST" class="shadow bg-body rounded p-4 ">
            <!-- 2 column grid layout with text inputs for the first and last names -->
            <h1 class="text-center" style=" color:#7529C0;">Add Employee</h1>
            
            <div class="row mb-4 mt-3">
              <div class="col">
                <div class="form-outline">
                  <input type="text" id="form6Example1" name="Fname" class="form-control" required/>
                  <label class="form-label" for="form6Example1">First name</label>
                </div>

              </div>
       
            </div>
        
            <div class="row mb-4">
                <div class="col">
                  <div class="form-outline">
                    <input type="text" id="form6Example1" name="CIN" class="form-control" required />
                    <label class="form-label" for="form6Example1">CIN</label>
                  </div>
                </div>
                <div class="col">
                  <div class="form-outline">
                    <input type="text" id="form6Example2" name="email" class="form-control" required />
                    <label class="form-label" for="form6Example2">Email</label>
                  </div>
                </div>
              </div>
          
            
              <div class="row mb-4">
              
                <div class="col">
                  <div class="form-outline">
                    <input type="text" id="form6Example2"  name="phone" class="form-control" />
                    <label class="form-label" for="form6Example2">N° phone</label>
                  </div>
                </div>

                <div class="col text-center">
                <select  class="form-select"  name="service" aria-label="Default select example" required>
                  <option selected>Service</option>
                  <option >Brushing </option>
                  <option >Coloration </option>
                  <option >Haircut </option>
                  <option >Manicure </option>
                  <option >Pedicure </option>
                  <option >Scrub </option>
                  <option >Facial </option>
                  <option >Arms </option>
                  <option >Eyebrows </option>

                 </select>
                </div>
     
              </div>
            <!-- Submit button -->
            <div class="text-center">
                <button type="submit" name="sb" class="btn " style="background-color: #7529C0;color:bisque">ADD</button>

             </div>
          </form>
      </div>
    </div>
       
    </div>

    <!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.js"></script>
</body>
</html>