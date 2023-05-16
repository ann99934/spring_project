<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style type="text/css">
.btn {
	width: 500px;
	height: 500px;
}
</style>
</head>
<body>
<h1>
	Hello world!  
</h1>
<input type="button" class="btn" value="Main" onclick = "location.href='/notice/main'">
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
