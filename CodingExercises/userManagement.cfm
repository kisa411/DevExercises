<!--- 
form that asks for user's: 
*address
*LinkedIn link
*tshirt size
*website bio
*first name
 --->
 <!DOCTYPE html>
 <html>
 <head>
	<title>User Management Tool</title>
 </head>
 
 <body>
	<form action="userManagementUpdate.cfm" method="post">	
	<!--- User's first name --->
	Name:<br>
	<input type="text" name="name"><br>
	<!--- User's Address --->
	Address:<br>
	<input type="text" name="address"><br>
	<!--- User's T-shirt Size --->
	T-shirt Size:<br>
	<select name="shirtSize">
		<option value="S">Small</option>
		<option value="M">Medium</option>
		<option value="L">Large</option>
		<option value="X">X-Large</option>
	</select><br>
	<!--- User's website bio --->
	Short profile:<br>
	<textarea name="profile" rows="10" cols="40"></textarea><br>
	<!--- User's LinkedIn link --->
	Linkedin link:<br>
	<input type="text" name="URL"><br><br>
	<input type="submit" value="submit"><br>
	</form>
 </body>
 
 </html>