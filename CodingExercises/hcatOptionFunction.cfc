<cfcomponent>

	<cffunction name="returnContingencies" access="remote">
		<cfargument name="hcatOption" type="numeric" required="true">
		<cfquery datasource="callmeasurement" name="contingency">
			SELECT distinct(c.frn_hcatid)
			FROM hcat_option o
			JOIN hcat_contingency c
			ON o.frn_hcatid = c.frn_hcatid
			WHERE c.contingent_frn_hcat_optionid=#hcatOption#;
		</cfquery>
		<cfset contingency_list = ValueList(contingency.frn_hcatid)> <!--- put query results into a list --->
		
		<cfset contingency_list = ValueList(contingency.frn_hcatid)>
		<cfif ListLen(contingency_list) IS 0>
			<cfoutput> The list was empty. </cfoutput>
			<cfelse>
				List of Hcat Option Contingencies: <br>
				<cfloop index = "ListElement" list = "#contingency_list#">  
					<cfoutput>#ListElement#</cfoutput><br>  
				</cfloop>
		</cfif>
		
		Query Successful: <br> <cfdump var='#contingency#'/>
		</cffunction>
</cfcomponent>