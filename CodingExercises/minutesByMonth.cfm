<cftry>
	<!--- query SQL for data --->
	<cfquery datasource="callmeasurement" name="hproduct">
		SELECT *
		FROM archive.dbo.xcall_2015; 
	</cfquery>
	<cfdump var='#hprodut#'>
	
	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>