<cffunction name="returnContingencies" access="remote">
		<cfargument name="hcatOption" type="numeric" required="true">
		<cfquery datasource="callmeasurement" name="contingency">
			SELECT TOP 50 *
			from hcat_option
			WHERE hcat_optionid=#hcatOption#;
		</cfquery>
		
		<cfset contingency_list = ValueList(contingency.frn_hcatid)>
		<cfif isNull(contingency_list)>
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
