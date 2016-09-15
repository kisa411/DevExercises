<cftry>
	<!--- query SQL for data --->
<!--- 	<cfquery datasource="callmeasurement" name="account">

		SELECT TOP 500 *
		FROM dnis d
		INNER JOIN archive.dbo.xcall_2016 x
		ON d.dnisid=x.cf_frn_dnisid
		INNER JOIN archive.dbo.xcall_2016_hcat h
		ON h.frn_callid=x.callid
		INNER JOIN lskin l
		ON d.add_lskinid=l.lskinid
		WHERE frn_hcatid='3' AND frn_hcat_optionid='10' AND l.lskinid='55';
		
	</cfquery> --->
	
	<cfquery datasource="callmeasurement" name="outbound">

		SELECT TOP 500 *
		FROM dnis d
		INNER JOIN archive.dbo.xcall_2016 x
		ON d.dnisid=x.cf_frn_dnisid
		INNER JOIN archive.dbo.xcall_2016_hcat h
		ON h.frn_callid=x.callid
		INNER JOIN lskin l
		ON d.add_lskinid=l.lskinid
		WHERE frn_hcatid='3' AND frn_hcat_optionid='10' AND l.lskinid='55' AND (h.tz_date between '2016-01-01' AND '2016-01-15');
		
	</cfquery>
	<cfdump var='#outbound#'>
	<cfoutput>
		<cfset customers = #account.lskinidCountCustomers#>
		<cfset outbound = #outbound.lskinidCountOutbound#>
		<cfset percentage = (customers/outbound)*100>
		
		Total number of missed customers: #customers#
		Total number of returned outbound calls: #outbound#
		Percentage of missed customers who received a returned outbound call: #percentage#
	</cfoutput>
		d.isoutbound='1'
	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>