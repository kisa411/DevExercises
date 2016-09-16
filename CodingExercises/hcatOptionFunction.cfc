<cfcomponent>

	<cffunction name="returnContingencies" access="remote">
		<cfargument name="hcatOption" type="numeric" required="true">
		<cfquery datasource="callmeasurement" name="contingency">
			SELECT distinct(c.frn_hcatid)
			FROM hcat_option o
			JOIN hcat_contingency c
			ON o.frn_hcatid = c.frn_hcatid
			WHERE c.contingent_frn_hcat_optionid=#form.hcatOption#;
		</cfquery>
		<cfset contingency_list = ValueList(contingency.frn_hcatid)> <!--- put query results into a list --->

	</cffunction>
		List of Hcat Option Contingencies:<br>
		<cfloop index = "ListElement" list = "#contingency_list#">  
			<cfoutput>#ListElement#</cfoutput><br>  
		</cfloop>
		
		Query Successful: <br> <cfdump var='#contingency#'/>
</cfcomponent>