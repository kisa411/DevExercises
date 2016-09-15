<cftry>
	<!--- query SQL for data --->
	<cfquery datasource="callmeasurement" name="account">
		SELECT l.refname, l.lskinid, a.tz_date, a.leminutes, l.masterlskin
		FROM lskin l
		INNER JOIN dnis d
		ON l.lskinid=d.add_lskinid
		INNER JOIN archive.dbo.xcall_2015 a
		ON d.dnisid = a.cf_frn_dnisid
		WHERE l.masterlskin='19153';
	</cfquery>
	<cfdump var='#account#'>
	
	
	<!--- save query results into .xls file --->
	<!--- <cfspreadsheet action="write" filename="minutesByMonth.xls" query="account" overwrite="true">
	 --->
	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>