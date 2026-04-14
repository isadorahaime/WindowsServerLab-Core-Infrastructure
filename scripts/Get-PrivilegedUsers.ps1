Get-ADGroupMember -Identity "Domain Admins" | Select-Object Name, SamAccountName | Export-Csv "Relatorio_Admins.csv"
