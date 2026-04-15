Get-ADGroup -Filter * | Get-ADGroupMember | Select-Object @{Name="Grupo";Expression={$_.distinguishedname.split(',')[1].split('=')[1]}}, Name
