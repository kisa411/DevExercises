<cftry>
	<!--- query SQL for data --->
	<cfquery datasource="callmeasurement" name="account">

		SELECT TOP 10 *
		FROM archive.dbo.xcall_2016_hcat; 
		
	</cfquery>
	<cfdump var='#account#'>
	
	
	<!--- save query results into .xls file --->
	<cfspreadsheet action="write" filename="minutesByMonth.xls" query="account" overwrite="true">
	
	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>