<cfset numbers = ArrayNew(1)>

<cfset ArrayAppend(numbers, "Thing to add")>
<cfset ArrayAppend(numbers, "Word.")>
<cfset ArrayPrepend(numbers, "Hi")>

<cfloop array=#numbers# index="item">
	<cfoutput>
	#item# <br/>
	</cfoutput>
</cfloop>
<br/>
<cfset ArrayInsertAt(numbers, 2, "Inserted phrase.")>
<cfdump var="#numbers#">
<!--- <cfabort> ---> <!--- stops program --->

<cfloop array=#numbers# index="item">
	<cfoutput>
	#item# <br/>
	</cfoutput>
</cfloop>




<!---<cflocation url="age.cfm"> ---> <!--- redirects webpage to this url right away --->
<!--- <cfheader> --->

