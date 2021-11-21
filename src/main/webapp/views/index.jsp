<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
  
  <a class="navbar-brand" href="/">Sayan Mock Pagination</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/">Index <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/viewAllPage">View All</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/addUserForm">Add Users</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled">Nothing</a>
      </li>
    </ul>
  </div>
  
</nav>


<div class="container">
	<div class="d-flex justify-content-center align-items-center vh-100">
	
		<div class="jumbotron">
		  <h1 class="display-4">Sayan Mock Pagination</h1>
		  <p class="lead">This Is only a mock test project</p>
		  <hr class="my-4">
		  <p>Works :: Add Users, Update, Delete, Paginate and Hopefully Sorting</p>
		  <a class="btn btn-primary btn-lg" href="/viewAllPage" role="button">View All List</a>
		</div>
		
	</div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>