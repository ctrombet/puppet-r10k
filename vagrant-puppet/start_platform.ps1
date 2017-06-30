$local = Get-Location;

If(!(test-path $local/shared)){
  Write-Host 'Folder code not exist....creating';
  New-Item -ItemType Directory -Path $local/shared
}

If (vagrant plugin list | out-string -stream | select-string vbguest) {
  Write-Host 'VBGuest Installed already'
}
Else {
  vagrant plugin install vagrant-vbguest
}

vagrant up