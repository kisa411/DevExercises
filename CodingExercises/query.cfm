<cftry>

	<cfquery datasource="callmeasurement" name="outbound">
		With HumanaticQuery as 
        (
			select x.frn_calllog_aniid as missed, y.frn_calllog_aniid as returned, 
				x.tz_datetime as missed_tz, y.tz_datetime as returned_tz, xd.frn_dnisfunctionid
			from archive.dbo.xcall_2016_hcat xh 
				join archive.dbo.xcall_2016 x on frn_callid = callid
				join dnis on cf_frn_dnisid = dnisid
				left join archive.dbo.xcall_2016 y on x.frn_calllog_aniid = y.frn_calllog_aniid and y.tz_datetime > x.tz_datetime
				left join xdnis xd on xd.dnisid = y.cf_frn_dnisid and frn_dnisfunctionid = 2
			where frn_hcat_optionid = 10
				and frn_hcatid = 3
				and dnis.add_lskinid = 55
				and xd.add_lskinid = 55
				and x.tz_date between '2016-01-01' and '2016-01-15'
        )
		SELECT COUNT(DISTINCT (CASE WHEN returned_tz <= missed_tz THEN missed ELSE null END)) as MissedCustomers, 
		COUNT (DISTINCT (CASE WHEN returned_tz > missed_tz and frn_dnisfunctionid = 2 THEN returned ELSE null END)) as OutboundReturns
		from HumanaticQuery
	</cfquery>
	
	<cfdump var='#outbound#'>
	
	

	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>