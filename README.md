# What
This repo holds some vagrant boxes and their associated scripts for various tasks like software building, etc. 

1.  Windows 2016 to build fabricator Style Guide based on node

# How

1.  rename vagrant file to "Vagrantfile"
2.  rename shell folder to "shell"
3.  vagrant up

# Build base box with Packer
Prepare for working environment by installing dependent tools
```
choco upgrade packer
choco upgrade vagrant
```
Copy scripts and packer files from  StefanScherer / packer-windows
```
git clone https://github.com/StefanScherer/packer-windows.git
mkdir answer_files/server_2004/ ; copy .\packer-windows\answer_files\server_2004\Autounattend.xml answer_files\server_2004\
mkdir floppy ; copy .\packer-windows\floppy\WindowsPowershell.lnk floppy\
mkdir scripts 
copy .\packer-windows\scripts\compact.bat scripts\
copy .\packer-windows\scripts\compile-dotnet-assemblies.bat scripts\
copy .\packer-windows\scripts\debloat-windows.ps1 scripts\
copy .\packer-windows\scripts\disable-screensaver.ps1 scripts\
copy .\packer-windows\scripts\disable-winrm.ps1 scripts\
copy .\packer-windows\scripts\enable-rdp.bat scripts\
copy .\packer-windows\scripts\enable-winrm.ps1 scripts\
copy .\packer-windows\scripts\microsoft-updates.bat scripts\
copy .\packer-windows\scripts\set-winrm-automatic.bat scripts\
copy .\packer-windows\scripts\uac-enable.bat scripts\
copy .\packer-windows\scripts\vm-guest-tools.bat scripts\
copy .\packer-windows\scripts\win-updates.ps1 scripts\
copy .\packer-windows\windows_server_2004.json windows_server_2004.json
```
Download iso file from MSDN site https://my.visualstudio.com/ Downloads section and copy it over; also click on that iso's info and update json file with the them. Mount the iso file(or manually) and get the wim name, confirme and update the index number in json file.
```
mkdir iso ; copy Downloads\en_windows_server_version_2004_updated_aug_2020_x64_dvd_1f6b0779.iso iso\
packer build --only=virtualbox-iso -var 'iso_url=./iso/en_windows_server_version_2004_updated_aug_2020_x64_dvd_1f6b0779.iso' .\windows_server_2004.json
Mount-DiskImage (get-item 'C:\<fullpath>\WinSrv2019\iso\en_windows_server_version_2004_updated_aug_2020_x64_dvd_1f6b0779.iso').VersionInfo.FileName -PassThru -ErrorAction Stop
Get-WindowsImage -ImagePath e:\sources\install.wim
```

