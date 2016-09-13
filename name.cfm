<cfset name="Emily">

<cfparam name="bonobono" default="ozzy">
<cfoutput>
	Hello #name#
</cfoutput>

<cfset colorRandom="blue">
<cfif IsDefined("colorRandom")>
	Color is already defined as #colorRandom#.
<cfelseif colorRandom eq "blue">
	Color is already defined and found to be #colorRandom#.
<cfelse>
	Color has been changed to #colorRandom#.
	<cfparam name="red" default="yellow">
</cfif>