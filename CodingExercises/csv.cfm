<cftry>
	<!--- query SQL for data --->
<!--- 	<cfquery>
		
	</cfquery> --->
	
	<!--- create .csv file --->
	
	<!--- send email --->
	<cfmail to="#form.email#"
		from="no-reply@callmeasurement.com"
		subject="hproduct Data"
		type="text"
	>
		<cfmailparam file="pika1.jpg"> <!--- attaches file to email body --->
		
		Attached is the .csv file with the hproduct information!

	</cfmail>
	
	<cfoutput> hproductID: "#form.ID#", email: "#form.email#" </cfoutput>
	
	<cfcatch>
		<cfoutput> The SQL query couldn't be called. Check your inputs and try again! </cfoutput>
	</cfcatch>
</cftry>