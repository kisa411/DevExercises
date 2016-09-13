<cfset age=70>
<cfif age eq 80>  <!---equal to--->
	You're pretty old.
<cfelseif age gt 80> <!---greater than--->
	You're even older than 80!
<cfelse> 
</cfif>
	You're not that old. <br>

<cfset variable=false>
<cfloop condition="variable eq false">
	<cfoutput>
	variable= <b>#variable#</b> <br>
	</cfoutput>
		<cfif RandRange(1,10) eq 10>
			<cfset variable="true">
			Random number was 10, so variable is now set to true. <br>
		</cfif>
	</cfloop>
<cfoutput>
	variable = <b>#variable#</b> (loop is done) <br>
</cfoutput>