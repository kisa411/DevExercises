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
		
<!--- 		SELECT linkedin_page, tshirt, website_bio, leaddress
		FROM go.dbo.leuseradmin_TEST
		WHERE adminname='#form.name#'; --->
	</cfquery>
		<cfif '#form.name#' IS NOT "">
			<cfoutput> Database updated for #form.name# </cfoutput>
		<cfelse>
			<cfoutput> Did you put in a name? Please check your inputs!</cfoutput>
		</cfif>
		
	<cfcatch>
		<cfoutput> #form.name# - Database wasn't able to be updated. Please check your input! </cfoutput>
	</cfcatch>
</cftry>
