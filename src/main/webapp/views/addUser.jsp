<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark navbar-expand-sm">
  
        <a class="navbar-brand" href="/">Sayan Mock Pagination</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="/">Index</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/viewAllPage">View All</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="/addUserForm">Add Users<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled">Nothing</a>
            </li>
          </ul>
        </div>
        
      </nav>

    <div class="container">
        <div class="d-flex justify-content-center align-items-center vh-100">

            <div class="card col-6 p-5">
                <h3 class="card-title center mx-auto"> ${purpose} User</h3>
                <hr>
                <div class="card-body">
                    <form:form action="saveUser" modelAttribute="user" method="post">
                    <form:hidden path="id" />

                    <div class="form-group">
                        <label for="userName"><strong>Enter User Name :</strong></label>
                        <form:input path="userName" cssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password"><strong>Enter User's password :</strong></label>
                        <form:input path="password" cssClass="form-control" />
                    </div>
                                    
                    <input class="btn btn-primary w-100" type="submit" value="Submit" />                            
                </form:form> 
                </div>    
            </div>

        </div>
        
    </div>
    
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>