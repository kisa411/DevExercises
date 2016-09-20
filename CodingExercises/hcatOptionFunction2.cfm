<!--- get variables from hcatOptionFunction.cfm, then call on functions from hcatOptionFunction.cfc --->

<cfobject  
    name="hcatOptionFunction"  
    component="hcatOptionFunction"> 
	
	<cfset contingency_list =""> <!--- create an empty list ---> 
	<cfset contingency_list=ListAppend(contingency_list, hcatOptionFunction.populateContingencies(contingency_list, #form.hcatOption#))> <!--- add populated contingencies to the list --->
	
	<cfset hcatOptionFunction.printContingencies(contingency_list)>