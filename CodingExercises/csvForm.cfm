<!DOCTYPE html>
<html>
<head>
	<title> Form </title>
</head>


<body>
	<form action="csv.cfm" method="post">
	<!--- include form elements - subject, email, message --->
		hproduct:<br>
		<input type="text" name="subject" value=""><br>
		Email (to send csv file to):<br>
		<input type="text" name="email" value=""><br><br>
		<input type="submit" value="submit"><br>
	</form>
	
	
	
</body>
