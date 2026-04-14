# 🖥️ Implementação de Infraestrutura Híbrida e Segura

### 🎯 Objetivo do Projeto
***"Simular um ambiente de médio porte para demonstrar habilidades em administração de servidores, automação com PowerShell e aplicação do princípio de privilégio mínimo (Least Privilege)."***

---

### 🛠️ Tecnologias Utilizadas

* Virtualização: Hyper-V / VMware vSphere.

* Sistemas: Windows Server 2022 & Windows 10/11.

* Serviços: AD DS, DNS, DHCP, Group Policy (GPO).

* Automação: PowerShell.

---

### 🏗️ Implementação Passo a Passo

* Estrutura de OUs: Criei uma hierarquia baseada em departamentos (RH, Financeiro, TI) para facilitar a aplicação de políticas.

* Delegação de Controle (O Diferencial): Em vez de usar a conta de Administrador para tudo, configurei uma conta de Operador.

* Desafio: O operador precisava resetar senhas sem ter acesso total ao servidor.

* Solução: Deleguei a permissão específica no AD e utilizei o módulo RSAT via PowerShell para contornar limitações de interface.

***GPOs Aplicadas:***

* Mapeamento automático de drives de rede baseado no grupo do usuário.

* Restrição de acesso ao CMD e Painel de Controle para usuários finais.

---

### 🗺️ Arquitetura do Ambiente

***A topologia abaixo descreve a segmentação lógica de Unidades Organizacionais (OUs) e a conectividade entre o Controlador de Domínio e as Estações de Trabalho.***

![Arquitetura do LAB](docs/Diagrama.png)

---

### 💻 Scripts em Destaque

| Script | Função | Caminho |
| :--- | :--- | :--- |
| **Password Reset** | Automatiza o reset de senha com expiração forçada. | [`/scripts/passwordChange`](scripts/passwordChange) |
| **Bulk Import** | Criação de usuários em massa via arquivo CSV. | [`/scripts/CreateUsersFromCSV.ps1`](scripts/CreateUsersCSV.ps1) |
| **Group Report** | Lista todos os membros do grupo "Domain Admins".. | [`/scripts/Get-PrivilagedUsers.ps1`](scripts/Get-PrivilagedUsers.ps1) |

---

### 🔧 Troubleshooting: O Caso do RSAT

### Durante a configuração das ferramentas administrativas em uma estação de trabalho, encontrei o erro de sistema PathNotFound ao tentar instalar o módulo do Active Directory via interface.

***Solução Aplicada:***
Utilizei o PowerShell como Administrador para forçar a instalação do recurso através do comando:

```powershell
Get-WindowsCapability -Online -Name "Rsat.ActiveDirectory*" | Add-WindowsCapability -Onlin
```
### Este desafio demonstrou a importância do domínio da linha de comando quando a interface gráfica (GUI) do Windows falha em ambientes de rede restritos.





