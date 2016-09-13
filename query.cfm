<!--query-->
<cfquery name="getTitles" datasource="Database name">
	SELECT top 3 title
	FROM datatable
</cfquery>

<cfloop query="getTitles">
	#title#
</cfloop>