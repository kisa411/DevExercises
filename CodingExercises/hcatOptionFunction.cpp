returnContingencies algorithm:

	returnContingencies(int frn_hcatid) { //user inputs hcatid 
		contingencyList = new List();
		
		// run SQL query - name="contingencies", with parameter as frn_hcatid
		
		if (contingencies.contingent_frn_hcat_optionid==NULL) {
			return contingencyList.append(contingencies.hcat_optionid);
		} else {
			return contingencyList.append(returnContingencies(contingencies.contingent_frn_hcat_optionid));
		}
	}
	
	
		<cfset contingency_list="">
		<cfif contingency.RecordCount gt 0>
		  <cfset isAppended = ListAppend(contingency_list, contingency)> <!--- add the contingencies from query to the list --->
		  <cfloop query = "contingency">
			<cfset HCatOption = new HcatOption()>
			<cfset recursedContingency = HCatOption.getContingencies(contingency.hcat_optionid)>
			<cfset isAppended = ArrayAppend(queryArray, recursedContingency)>
		  </cfloop>
		</cfif>
		<cfreturn queryArray>