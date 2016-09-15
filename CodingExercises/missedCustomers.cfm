<cftry>
	<!--- query SQL for data --->
	<cfquery datasource="callmeasurement" name="account">

		SELECT *
		FROM dnis d
		INNER JOIN archive.dbo.xcall_2016 x
		ON d.dnisid=x.cf_frn_dnisid
		INNER JOIN archive.dbo.xcall_2016_hcat h
		ON h.frn_callid=x.callid
		INNER JOIN lskin l
		ON d.add_lskinid=l.lskinid
		WHERE frn_hcatid='3' AND frn_hcat_optionid='10' AND l.lskinid='55' AND (DATEPART(mm,h.tz_date) = '01' AND DATEPART(dd, h.tz_date) < '16');
		
	</cfquery>
	<cfdump var='#account#'>
	
	
	<!--- save query results into .xls file --->
	<cfspreadsheet action="write" filename="minutesByMonth.xls" query="account" overwrite="true">
	
	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>