
<cfinclude template="header.cfm">

<p>Coldfusion tutorial!</p>

<cfinclude template="footer.cfm">

<cfloop list="1;2;3;4,5" index="ListItem" delimiters=",;">
	<cfoutput>
		#ListItem#<br />
	</cfoutput>
</cfloop>

<cfset numbers_list=["1, 2, 3, 4, 5, 6"]> <!--make a list containing numbers-->
	<!--- ListToArray(numbers_list) ---> <!--convert list to array-->

	
	<cfloop array=#numbers_list# index="i">
		<cfoutput>
			#i# <br />
		</cfoutput>
	</cfloop>

	<cfset numbers_list=["1, 2, 3, 4, 5, 6"]> <!--make a list containing numbers-->

	<!--- looping through an array --->
	<cfloop array=#numbers_list# index="i">
		<cfoutput>
			#i# <br />
		</cfoutput>
	</cfloop>
	
	<!--- looping through a list --->
	<cfset testList='Jeff, John, Steve, Julliane'> <!--- create a test list --->
	<cfloop list="#testList#" index="item">
		#item# <br />
	</cfloop>
	
	

