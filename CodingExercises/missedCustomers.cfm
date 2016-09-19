<cftry>
	<!--- the missed call customers query --->
	<cfquery datasource="callmeasurement" name="missed">
		select count(distinct x.frn_calllog_aniid) as Missed
		from archive.dbo.xcall_2016_hcat xh 
			join archive.dbo.xcall_2016 x on frn_callid = callid
			join dnis on cf_frn_dnisid = dnisid
		where frn_hcat_optionid = 10
			and frn_hcatid = 3
			and dnis.add_lskinid = 55
			and x.tz_date between '2016-01-01' and '2016-01-15';
	</cfquery>
	
	<!--- missed call customers who received return outbound calls query --->
	<cfquery datasource="callmeasurement" name="outbound">
		WITH Outbound AS
		(
		select x.frn_calllog_aniid as Missed, cf_frn_dnisid, x.tz_datetime
			from archive.dbo.xcall_2016_hcat xh 
				join archive.dbo.xcall_2016 x on frn_callid = callid
				join dnis on cf_frn_dnisid = dnisid
			where frn_hcat_optionid = 10
				and frn_hcatid = 3
				and dnis.add_lskinid = 55
				and x.tz_date between '2016-01-01' and '2016-01-15'
		)
		SELECT * 
		FROM Outbound
			join archive.dbo.xcall_2016 x on Outbound.Missed = x.frn_calllog_aniid 
			join dnis d on Outbound.cf_frn_dnisid = d.dnisid
			WHERE x.tz_datetime > Outbound.tz_datetime
				and d.isoutbound = 1
			
	</cfquery>
	<cfdump var='#outbound#'>
	<cfoutput>
		<cfset customers = #missed.Missed#>
		<cfset outbound = #outbound.Outbound#>
		<cfset percentage = (customers/outbound)*100>
		
		Total number of missed customers: #customers#
		Total number of returned outbound calls: #outbound#
		Percentage of missed customers who received a returned outbound call: #percentage#
	</cfoutput>
	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>