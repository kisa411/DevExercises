<!--- SQL update statements --->
<!--- 6300 = 172.20.40.151 --->

<cfquery datasource="WDB6300" name="userinfo" result="r">
	SELECT TOP 5 *
	FROM leuseradmin_TEST;
</cfquery>

<cfdump var="#userinfo#"/>