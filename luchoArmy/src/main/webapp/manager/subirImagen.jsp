<%--
  Created by IntelliJ IDEA.
  User: Kots
  Date: 5/30/2023
  Time: 2:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="VideojuegoServlet">Hello Servlet</a>

<h1>Subir imagen</h1>
<form method="post" enctype="multipart/form-data" action="/image/upload">
    <input type="file" name="file" accept="image/*">
    <input type="submit" value="Subir">
</form>
</body>
</html>