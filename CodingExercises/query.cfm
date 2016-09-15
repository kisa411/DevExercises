<cftry>
	<!--- query SQL for data --->
<!--- 	<cfquery datasource="callmeasurement" name="account">
		SELECT TOP 50 *
		FROM dnis d
		INNER JOIN archive.dbo.xcall_2016 x
		ON d.dnisid=x.cf_frn_dnisid
		INNER JOIN archive.dbo.xcall_2016_hcat h
		ON h.frn_callid=x.callid
		INNER JOIN lskin l
		ON d.add_lskinid=l.lskinid
		WHERE frn_hcatid='3' AND frn_hcat_optionid='10' AND l.lskinid='55';
		
	</cfquery>  --->
	
	<cfquery datasource="callmeasurement" name="outbound">

		select *
		from archive.dbo.xcall_2016_hcat xh 
			join archive.dbo.xcall_2016 x on frn_callid = callid
			join dnis on cf_frn_dnisid = dnisid
			left join archive.dbo.xcall_2016 y on x.frn_calllog_aniid = y.frn_calllog_aniid and y.tz_datetime > x.tz_datetime
			left join xdnis xd on xd.dnisid = y.cf_frn_dnisid
		where frn_hcat_optionid = 10
			and frn_hcatid = 3
			and dnis.add_lskinid = 55
			and x.tz_date between '2016-01-01' and '2016-01-15'
				
	</cfquery>
	
	<cfdump var='#outbound#'>
	
	

	<cfcatch>
		<cfdump var='#cfcatch#'/>
	</cfcatch>
</cftry>