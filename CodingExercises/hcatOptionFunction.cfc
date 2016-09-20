<cfcomponent>

	<!--- function to populate list of possible options --->
	<cffunction name="populateContingencies" access="public">
		<cfargument name="contingency_list" type="string" required="true">
		<cfargument name="hcatOption" type="integer" required="true">
		<cfoutput> Added: #hcatOption# <br><br></cfoutput>
		<cfquery datasource="callmeasurement" name="contingency">
			SELECT distinct(hcat_optionid), contingent_frn_hcat_optionid
			FROM hcat_option o
			JOIN hcat_contingency c
			ON o.frn_hcatid = c.frn_hcatid
			WHERE (limit_frn_lskinid IS NULL) 
				AND (hco_override=0) 
				AND (c.frn_hcatid=<cfqueryparam value="#hcatOption#" cfsqltype="cf_sql_integer">) 
				AND (handledby_frn_phonecodeid IS NULL)
		</cfquery>
		
		<cfset temp_list=ValueList(contingency.hcat_optionid)> 
		<cfset contingency_list=ListAppend(contingency_list, temp_list)> <!--- append temp_list to overall list --->
		
		<cfloop index = "ListElement" list = "#contingency_list#">  
			<cfoutput>#ListElement#</cfoutput><br>
		</cfloop>
		<br>  
		<cfif contingency.RecordCount gt 0>
			<cfloop query="contingency">				
				<cfset temp_list = populateContingencies(contingency_list, hcat_optionid)>
			</cfloop>
		</cfif>
		<cfreturn contingency_list>
	</cffunction>
		

	
	
	<!--- function to print out the list of possible options --->
	<cffunction name="printContingencies" access="public">
		<cfargument name="contingency_list" type="string" required="true">
		<cfif ListLen(contingency_list) IS 0>
			<cfoutput> The list was empty. </cfoutput>
			<cfelse>
				List of Hcat Option Contingencies: <br>
				<cfloop index = "ListElement" list = "#contingency_list#">  
					<cfoutput>#ListElement#</cfoutput><br>  
				</cfloop>
		</cfif>
		
	</cffunction>
</cfcomponent>