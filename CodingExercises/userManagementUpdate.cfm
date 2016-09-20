<!--- SQL update statements --->
<!--- 6300 = 172.20.40.151 --->

<cftry>
	<cfif '#form.name#' IS NOT "">
	<cfquery datasource="6300" name="userinfo" result="r">
		<!--- need to specify which table to get data from (go.dbo.leuseradmin_TEST) --->
		UPDATE go.dbo.leuseradmin_TEST
		SET linkedin_page=<cfqueryparam value="#form.URL#" cfsqltype="cf_sql_varchar">, 
			tshirt=<cfqueryparam value="#form.shirtSize#" cfsqltype="cf_sql_varchar">, 
			website_bio=<cfqueryparam value="#form.profile#" cfsqltype="cf_sql_varchar">, 
			leaddress=<cfqueryparam value="#form.address#" cfsqltype="cf_sql_varchar">
		WHERE lower(adminname)='#LCase(form.name)#';

			
		SELECT linkedin_page, tshirt, website_bio, leaddress
		FROM go.dbo.leuseradmin_TEST
		WHERE lower(adminname)='#LCase(form.name)#';
	</cfquery>
		 <!---  <cfif r.recordCount >--->
			<cfoutput> Database updated for #form.name# </cfoutput>
		<cfelse>
			<cfoutput> Did you put in a name? Please check your inputs!</cfoutput>
		</cfif>
		
	<cfcatch>
		<cfoutput> #form.name# - Database wasn't able to be updated. Please check your input! </cfoutput>
		<cfoutput> #LCase(form.name)# </cfoutput>
		<cfdump var='#userinfo#'> 
	</cfcatch>
</cftry>
