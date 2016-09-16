<!DOCTYPE html>
<html>

<head>
	<h1> Hcat Option Contingency </h1>
</head>

<body>
	<form action="test.cfc" method="POST">
		<input type="Hidden" name="method" value="returnContingencies">
		hcat_option:</br>
		<input type="text" name="hcatOption" value=""><br>
		<input type="submit" value="submit"><br>
	</form>

<!--- 		<cfinvoke component="hcatOptionFunction.cfc" method="returnContingencies" hcatOption="#form.hcatOption#"></cfinvoke> --->
</body>
</html>