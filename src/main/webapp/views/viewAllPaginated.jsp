<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All</title>
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
              <a class="nav-link active" href="/viewPageinated">View All</a>
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

      <c:url var="userNameLink" value="/page">
        <c:param name="pageNo" value="${currentPage}" />
        <c:param name="sortField" value="userName" />
        <c:param name="sortDirection" value="${reverseSortDirection}" />
      </c:url>

      <c:url var="passwordLink" value="/page">
        <c:param name="pageNo" value="${currentPage}" />
        <c:param name="sortField" value="password" />
        <c:param name="sortDirection" value="${reverseSortDirection}" />
      </c:url>

    <div class="container bg-light">
        <div class="d-flex flex-column justify-content-center align-items-center vh-100">

            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">
                        <a href="${userNameLink}">
                          Username
                        </a>
                      </th>
                      <th scope="col">
                        <a href="${passwordLink}">
                          Password
                        </a>
                      </th>
                      <th scope="col">Update Action</th>
                      <th scope="col">Delete Action</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${theUserList}" var="tempUser" varStatus="status">

                        <tr>
                            <c:url var="updateLink" value="/updateUserForm">
                                <c:param name="userID" value="${tempUser.id}" />
                                
                            </c:url>

                            <c:url var="deleteLink" value="/deleteUser">
                                <c:param name="userID" value="${tempUser.id}" />
                            </c:url>

                            <td>${status.count}</td>
                            <td>${tempUser.userName}</td>
                            <td>${tempUser.password}</td>
                            <td>
                                <a href="${updateLink}"><button class="btn btn-success px-3">Update</button></a>
                            </td>
                            <td>
                                <a href="${deleteLink}"	onclick="if (!(confirm('Are you sure you want to delete this User?'))) return false"><button class="btn btn-danger px-3">Delete</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>

            <c:if test = "${totalPages > 1}">
              <div class="row">
                <div class="col">
                  <div class="p-2">
                    Total Rows : ${totalItems}
                  </div>
                </div>
                <div class="col">
                  <nav aria-label="Page navigation example">
                    <ul class="pagination">

                      <c:url var="previousLink" value="/page">
                        <c:param name="pageNo" value="${currentPage-1}" />
                        <c:param name="sortField" value="${sortField}" />
                        <c:param name="sortDirection" value="${sortDirection}" />
                      </c:url>

                        <c:if test="${currentPage-1 == 0 }">
                          <li class="page-item disabled"><a class="page-link" href="${previousLink}">Previous</a></li>
                        </c:if>
                        <c:if test="${currentPage-1 != 0 }">
                          <li class="page-item"><a class="page-link" href="${previousLink}">Previous</a></li>
                        </c:if>
                      
                        <c:forEach begin="1" end="${totalPages}" var="i">
                          <li class="page-item ${currentPage == i ? 'disabled' : ''}">
                          

                            <c:url var="seqLink" value="/page">
                                <c:param name="pageNo" value="${i}" />
                                <c:param name="sortField" value="${sortField}" />
                                <c:param name="sortDirection" value="${sortDirection}" />
                            </c:url>

                            <a class="page-link" href="${seqLink}">${i}</a>
                          </li>
    
                        </c:forEach>
                        
                        <c:url var="nextLink" value="/page">
                                <c:param name="pageNo" value="${currentPage+1}" />
                                <c:param name="sortField" value="${sortField}" />
                                <c:param name="sortDirection" value="${sortDirection}" />
                            </c:url>

                        <c:if test="${currentPage+1 <= totalPages}">
                            <li class="page-item"><a class="page-link" href="${nextLink}">Next</a></li>
                        </c:if>
                        <c:if test="${currentPage+1 > totalPages}">
                          <li class="page-item disabled"><a class="page-link" href="${nextLink}">Next</a></li>
                        </c:if>
                    </ul>
                  </nav>
                </div>
              </div>
            </c:if>

        </div>
    </div>
    
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>