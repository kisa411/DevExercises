<cfcomponent>

	<!--- function to populate list of possible options --->
	<cffunction name="populateContingencies" access="public">
		<cfargument name="contingency_list" type="string" required="true">
		<cfargument name="hcatOption" type="string" required="true">
		<!--- <cfoutput> Added: #arguments.hcatOption# <br><br></cfoutput> --->
		<!--- <cfquery datasource="callmeasurement" name="contingency">
			SELECT distinct(hcat_optionid), contingent_frn_hcat_optionid
			FROM hcat_option o
			JOIN hcat_contingency c
			ON o.frn_hcatid = c.frn_hcatid
			WHERE (limit_frn_lskinid IS NULL) 
				AND (hco_override=0) 
				AND (c.frn_hcatid=<cfqueryparam value="#arguments.hcatOption#" cfsqltype="cf_sql_string">) 
				AND (handledby_frn_phonecodeid IS NULL)
		</cfquery> --->
		
		<cfquery name="contingency" datasource="callmeasurement">
		  SELECT
			frn_hcatid,
			option_display,
			hcat_optionid
		  FROM hcat_option hco
		  WHERE hco.frn_hcatid IN (
			SELECT DISTINCT frn_hcatid
			FROM hcat_contingency
			WHERE contingent_frn_hcat_optionid = <cfqueryparam value="#hcatOption#" cfsqltype="CF_SQL_STRING">
		  )
		  AND hco.hco_override = 0
		  AND hco.hco_active = 1
		  ORDER BY frn_hcatid
		</cfquery>
		
		<!--- convert query results into a list and put it in temp_list --->
		<cfset temp_list=ValueList(contingency.hcat_optionid)> 
		<!--- append temp_list contents to contingency_list --->
		<cfset arguments.contingency_list=ListAppend(arguments.contingency_list, temp_list)> 

		<cfif contingency.RecordCount gt 0 AND len(hcatOption) NEQ 0>
			<cfloop query="contingency">				
				<cfset temp_list = populateContingencies(arguments.contingency_list, contingency.hcat_optionid)>
			</cfloop>
		</cfif>
		
		<cfreturn arguments.contingency_list>
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