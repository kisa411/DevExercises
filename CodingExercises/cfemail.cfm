
	<!--- send email through CF --->
	<cfmail to="#form.email#"
		from="no-reply@callmeasurement.com"
		subject="#form.subject#"
		type="text"

		
	>
		
	#form.message#

	</cfmail>
	<cfoutput> Email sent! </cfoutput>
