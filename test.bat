<!-- : Begin batch script
@echo off
echo batch output
cscript //nologo "%~f0?.wsf" //job:Main
exit /b

----- Begin wsf script --->
<package>
	<job id="Main">
		<script language="JavaScript" src="FileFind.js"/>
		<script language="JavaScript">
		//<![CDATA[
function main()
{
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	
	var folderpath = "D:\\home\\kojiro\\tm"
	
	var findfile = new FileFind(folderpath);
	var files = findfile.getFiles(folderpath);
	
	var i;
	for(i = 0; i < files.length; i++){
		WScript.Echo("INFO : " + files[i]);
	}
}

main();
		//]]>
	    </script>
	</job>
</package>
