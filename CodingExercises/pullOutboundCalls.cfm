
<!--- define starting row and max number of rows for display purposes --->
<cfparam name="StartRow" default="1">
<cfparam name="MaxRow" default="300">

<!--- Create query statements --->
<cfquery datasource="callmeasurement" name="accounts">
	<!--- select statements --->
	SELECT TOP 300 l.refname, xl.tz_datetime, xl.cf_frn_dnisid, d.isoutbound, xl.frn_xcall_dispositionid, xl.callid
	FROM dnis d
	INNER JOIN lskin l
	ON d.add_lskinid = l.lskinid
	INNER JOIN vwxcall_shortlong xl
	ON d.dnisid = xl.cf_frn_dnisid
	WHERE (l.refname = 'BHA - Showcase Honda' OR l.refname = 'BHA - Texas Toyota') AND (d.isoutbound=1 AND xl.frn_xcall_dispositionid=1)
	ORDER BY xl.tz_datetime DESC;


</cfquery>


<!DOCTYPE html>
<html>

<head>
	<h1> Account Information </h1>
	<!--- add CSS styling to HTML table --->
	<link rel="stylesheet" type="text/css" href="HTMLtable.css">
</head>

<body>
<cfoutput>
	<body>
		<table>
			<tr>
				<th>Row</th>
				<th>Account Name</th>
				<th>Call ID</th>
				<th>Line ID</th>
				<th>Date/Time</th>
			</tr>
		<tbody>
		<cfloop query="accounts">
			<tr>
				<td class='row'>#accounts.currentRow#</td>
				<td class='refname'>#accounts.refname#</td>
				<td class='callid'>#accounts.callid#</td>
				<td class='dnisid'>#accounts.cf_frn_dnisid#</td>
				<td class='datetime'>#accounts.tz_datetime#</td>
			</tr>
		</cfloop>
		</tbody>
		</table>
	</body>
</cfoutput>
</html>

