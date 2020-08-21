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
