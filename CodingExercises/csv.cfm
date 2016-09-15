<cftry>
	<!--- query SQL for data --->
	<cfquery datasource="callmeasurement" name="hproduct">
		SELECT product_name, l.refname, l.lskinid 
		FROM hproduct h
		INNER JOIN hproduct_lskin hl
		ON h.hproductid=hl.frn_hproductid
		INNER JOIN lskin l
		ON hl.frn_lskinid=l.lskinid
		WHERE h.hproductid='#form.ID#';
	</cfquery>
	
	<!--- <!--- create default .xls file --->
	<cfspreadsheet action="write" filename="hproduct.xls" query="hproduct" overwrite="true">--->
<!--- 	<cfset acfile = "hproduct.csv"> --->
<!--- 	<cfset TempFile = "">


	<cfif FileExists(TempFile)>
		<cffile action="delete" file="#TempFile#" >
	</cfif> --->

	<cfset fastFileWriter = createObject("java", "FastResultsetToFile")>
	<!--- <cfset fastFileWriter.exportResultsetToFile(hproduct, "#TempFile#", ',', "UTF-8")> --->
	<cfset fastFileWriter.exportResultsetToFile(hproduct, "hproduct.csv", ',', "UTF-8")>	

	<!--- send email --->
	<cfmail to="#form.email#"
		from="no-reply@callmeasurement.com"
		subject="hproduct Data"
		type="text"
	>
		<cfmailparam file="hproduct.csv"> <!--- attaches file to email body --->
		
		Attached is the .csv file with the hproduct information!

	</cfmail>
	
	<cfoutput> hproductID: "#form.ID#", email: "#form.email#" </cfoutput>
	
	<cfcatch>
		<cfdump var = "#cfcatch#" />
		<cfoutput> The SQL query couldn't be called (or something went wrong iono). Check your inputs and try again! </cfoutput>
	</cfcatch>
</cftry>