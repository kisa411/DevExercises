<cfcomponent displayname="HCatOption">
  <!--- return list of possible contingent hcat_options --->
  <cffunction name="getContingencies" returnType="array" access="public">
    <cfargument name="optionID" type="numeric" required="true">
    <!--- initial query --->
    <cfquery name="HCatContingencies" datasource="#application.ds#">
      SELECT
      	frn_hcatid,
      	option_display,
      	hcat_optionid
      FROM hcat_option hco
      WHERE hco.frn_hcatid IN (
      	SELECT DISTINCT frn_hcatid
      	FROM hcat_contingency
      	WHERE contingent_frn_hcat_optionid = <cfqueryparam value="#optionID#" cfsqltype="CF_SQL_INTEGER">
      )
      AND hco.hco_override = 0
      AND hco.hco_active = 1
      ORDER BY frn_hcatid
    </cfquery>
	
    <cfset queryArray = ArrayNew(1)>
    <cfif HcatContingencies.RecordCount gt 0>
      <cfset isAppended = ArrayAppend(queryArray, HcatContingencies)>
      <cfloop query = "HcatContingencies">
        <cfset HCatOption = new HcatOption()>
        <cfset recursedContingency = HCatOption.getContingencies(HcatContingencies.hcat_optionid)>
        <cfset isAppended = ArrayAppend(queryArray, recursedContingency)>
      </cfloop>
    </cfif>
    <cfreturn queryArray>
  </cffunction>
</cfcomponent>