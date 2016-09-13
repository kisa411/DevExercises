<!DOCTYPE html>
<html>
<head>
	<title> Email Form </title>
</head>


<body>
	<form action="cfemail.cfm" method="post">
	<!--- include form elements - subject, email, message --->
		Subject:<br>
		<input type="text" name="subject" value=""><br>
		Email:<br>
		<input type="text" name="email" value=""><br>
		Message:<br> <!--- fix left indent on message --->
		<textarea rows="5" cols="50" name="message">
		</textarea><br>
		<input type="submit" value="submit"><br>
	</form>
	
	
	
</body>

	