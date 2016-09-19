<cffunction name="returnContingencies" access="remote">
		<cfargument name="hcatOption" type="numeric" required="true">
		<cfquery datasource="callmeasurement" name="contingency">
			SELECT distinct(c.frn_hcatid)
			FROM hcat_option o
			JOIN hcat_contingency c
			ON o.frn_hcatid = c.frn_hcatid
			WHERE c.contingent_frn_hcat_optionid=#hcatOption#;
			
			<!--- SELECT distinct(frn_hcatid)
			from hcat_option
			WHERE hcat_optionid=#hcatOption#; --->
		</cfquery>
		
		<cfset contingency_list = ValueList(contingency.frn_hcatid)>
		<cfif ListLen(contingency_list) IS 0>
			<cfoutput> The list was empty. </cfoutput>
			<cfelse>
				<cfloop index = "ListElement" list = "#contingency_list#">  
					<cfoutput>#ListElement#</cfoutput><br>  
				</cfloop>
		</cfif>
		<br>
		<cfset contingency_list2 = "1,2,3,4,5"> <!--- put query results into a list --->
		<cfloop index = "ListElement" list = "#contingency_list2#">  
			<cfoutput>#ListElement#</cfoutput><br>  
		</cfloop>
		
		<cfoutput>Hcat Option: #hcatOption#</cfoutput>
	</cffunction>
