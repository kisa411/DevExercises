<!--- SQL update statements --->
<!--- 6300 = 172.20.40.151 --->

<cftry>
	<cfquery datasource="6300" name="userinfo" result="r">
		<!--- need to specify which table to get data from (go.dbo.leuseradmin_TEST) --->
		UPDATE go.dbo.leuseradmin_TEST
		SET linkedin_page='#form.URL#', 
			tshirt='#form.shirtSize#', 
			website_bio='#form.profile#', 
			leaddress='#form.address#'
		WHERE adminname='#form.name#';
		
		SELECT TOP 5 linkedin_page, tshirt, website_bio, leaddress
		FROM go.dbo.leuseradmin_TEST
		WHERE adminname='#form.name#';

	</cfquery>
	<cfdump var='#userinfo#'>
	<cfcatch>
		<cfoutput> #form.name# </cfoutput>
	</cfcatch>
</cftry>
