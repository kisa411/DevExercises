<!DOCTYPE html>
<html>
<head>
	<title> Form </title>
		
	<style>
		table {border: 3px solid black;}
		td {border: 1px solid black;}
	</style>
</head>


<body>
	<form action="csv.cfm" method="post">
	<!--- include form elements - subject, email, message --->
		hproductID (1-23):<br>
		<input type="text" name="ID" value=""><br>
		Email (to send csv file to):<br>
		<input type="text" name="email" value=""><br><br>
		<input type="submit" value="submit"><br>
	</form>
	
	<table align="left">
		<tr>
			<th>hproductID</th>
			<th>Product Name</th>
		</tr>
		<tr>
			<td>1</td>
			<td>Car Wars</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Patient Pursuit</td>
		</tr>
		<tr>
			<td>3</td>
			<td>Service Setter</td>
		</tr>
		<tr>
			<td>4</td>
			<td>SI Call Tracker</td>
		</tr>
		<tr>
			<td>5</td>
			<td>Lead Fetch</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Rent Buzz</td>
		</tr>
		<tr>
			<td>7</td>
			<td>SI Internal</td>
		</tr>
		<tr>
			<td>8</td>
			<td>Home Service</td>
		</tr>
		<tr>
			<td>9</td>
			<td>Service Hook</td>
		</tr>
		<tr>
			<td>10</td>
			<td>Car Wars Discovery</td>
		</tr>
		<tr>
			<td>11</td>
			<td>Car Wars Essentials</td>
		</tr>
		<tr>
			<td>12</td>
			<td>Car Wars Pro</td>
		</tr>
		<tr>
			<td>13</td>
			<td>Rent Buzz Focus</td>
		</tr>
		<tr>
			<td>14</td>
			<td>Rent Buzz Essentials</td>
		</tr>
		<tr>
			<td>15</td>
			<td>Rent Buzz Pro</td>
		</tr>
		<tr>
			<td>16</td>
			<td>Car Wars Outbound Enhanced</td>
		</tr>
		<tr>
			<td>17</td>
			<td>Car Wars Outbound Discovery</td>
		</tr>
		<tr>
			<td>18</td>
			<td>DDC Phone Skills Training</td>
		</tr>
		<tr>
			<td>19</td>
			<td>Service Hook Discovery</td>
		</tr>
		<tr>
			<td>20</td>
			<td>DS Car Wars Inboudn with C2C</td>
		</tr>
		<tr>
			<td>21</td>
			<td>Car Wars Starter</td>
		</tr>		
		<tr>
			<td>22</td>
			<td>Automotive Call Measurement</td>
		</tr>		
		<tr>
			<td>23</td>
			<td>Medical Call Measurement</td>
		</tr>	
	</table>
	

</body>
