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