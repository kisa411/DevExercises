<cftry>
	<!--- query SQL for data --->
	<!--- <cfquery datasource="callmeasurement" name="account">
		SELECT TOP 10 *
		FROM archive.dbo.xcall_2016_hcat;

	<!--- 	SELECT TOP 5 *
FROM archive.dbo.xcall_2016; --->
		
	</cfquery> --->
	
		<!--- query SQL for data --->
	<cfquery datasource="callmeasurement" name="account">

		SELECT TOP 500 *
		FROM dnis d
		INNER JOIN archive.dbo.xcall_2016 x
		ON d.dnisid=x.cf_frn_dnisid
		INNER JOIN archive.dbo.xcall_2016_hcat h
		ON h.frn_callid=x.callid
		INNER JOIN lskin l
		ON d.add_lskinid=l.lskinid
		WHERE frn_hcatid='3' AND frn_hcat_optionid='10' AND l.lskinid='55';
		
	</cfquery>
	<cfdump var='#account#'>
	
	
	<!--- save query results into .xls file --->
	<cfspreadsheet action="write" filename="minutesByMonth.xls" query="account" overwrite="true">
	
	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>