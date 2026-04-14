<#
.SYNOPSIS
    Script para reset de senha e expiração forçada.
.DESCRIPTION
    Este script foi desenvolvido para o Lab de Delegação de Controle.
#>
Param(
    [Parameter(Mandatory=$true)]
    [string]$UserName
)

Set-ADAccountPassword -Identity $UserName -Reset -NewPassword (Read-Host -AsSecureString -Prompt "Digite a nova senha")
Set-ADUser -Identity $UserName -ChangePasswordAtLogon $true
Write-Host "Senha alterada com sucesso para o usuário $UserName" -ForegroundColor Green
