$AppDir = "$HOME\Desktop\StyleGuide-Src"
$AppZipPath = "$HOME\Desktop\StyleGuide-Src.zip"
 
if (-not (Test-Path $AppDir))
{
	# Unzip
	Expand-Archive -Path $AppZipPath -DestinationPath $AppDir
}
else
{
	Write-Host "App is already installed"
}


# Build
cd $AppDir
npm install
gulp


if (Test-Path c:\vagrant\Vagrantfile)
{	if (Test-Path c:\vagrant\dist)
	{ 	Remove-Item -Path c:\vagrant\dist -Recurse -Force}
	Copy-Item -Path $AppDir\dist -Recurse -Destination c:\vagrant\dist -Container
}

