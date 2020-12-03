@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
\Python27\python create_repository.py -d krypton -i addons-info.xml -c addons-info.xml.md5 ..\plugin.onedrive ..\plugin.googledrive ..\script.module.clouddrive.common repository.cguzzman
\Python27\python create_repository.py -d matrix -i addons-info-matrix.xml -c addons-info-matrix.xml.md5 ..\..\kodi-19\plugin.onedrive ..\..\kodi-19\plugin.googledrive ..\..\kodi-19\script.module.clouddrive.common repository.cguzzman+matrix
copy krypton\repository.cguzzman\*.zip docs\
copy matrix\repository.cguzzman\*.zip docs\
del docs\*1.0.0*.zip

echo ^<html^> > docs\index.html
echo ^<head^>^<title^>Index of /^</title^>^</head^> >> docs\index.html
echo ^<body^>^<h1^>Index of /^</h1^>^<table^> >> docs\index.html
echo ^<tr^>^<th^>^<a^>Name^</a^>^</th^>^<th^>^<a^>Last modified^</a^>^</th^>^<th^>^<a^>Size^</a^>^</th^>^<th^>^<a^>Description^</a^>^</th^>^</tr^> >> docs\index.html
echo ^<tr^>^<th colspan=^"4^"^>^<hr /^>^</th^>^</tr^> >> docs\index.html
cd docs
for %%I in (*.zip) DO (
	set /a size=%%~zI/1024
	echo ^<tr^>^<td^>^<a href=^"%%I^"^>%%I^</a^>^</td^>^<td align=^"right^"^>%%~tI ^</td^>^<td align=^"right^"^>!size!K^</td^>^<td^>^&nbsp;^</td^>^</tr^> >> index.html
)
cd ..
echo ^<tr^>^<th colspan=^"4^"^>^<hr /^>^</th^>^</tr^> >> docs\index.html
echo ^</table^>^</body^> >> docs\index.html
echo ^</html^> >> docs\index.html

pause
