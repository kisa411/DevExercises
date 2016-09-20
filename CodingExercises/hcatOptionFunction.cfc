<cfcomponent>

	<!--- function to populate list of possible options --->
	<cffunction name="populateContingencies" access="remote">
		<cfargument name="hcatOption" type="integer" required="true">
		
		<cfset contingency_list =""> <!--- create an empty list ---> ValueList(contingency.frn_hcatid)> <!--- put query results into a list --->
		
		<cfquery datasource="callmeasurement" name="contingency">
			SELECT distinct(hcat_optionid)
			FROM hcat_option o
			JOIN hcat_contingency c
			ON o.frn_hcatid = c.frn_hcatid
			WHERE (limit_frn_lskinid IS NULL) AND (hco_override=0) AND (c.frn_hcatid=<cfqueryparam value="#hcatOption#" cfsqltype="cf_sql_integer">) AND (handledby_frn_phonecodeid IS NULL)
		</cfquery>
		
	</cffunction>
		
	
	<!--- function to print out the list of possible options --->
	<cffunction name="printContingencies" access="remote">
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