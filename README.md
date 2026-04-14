🖥️ Implementação de Infraestrutura Híbrida e Segura

🎯 Objetivo do Projeto
"Simular um ambiente de médio porte para demonstrar habilidades em administração de servidores, automação com PowerShell e aplicação do princípio de privilégio mínimo (Least Privilege)."

🛠️ Tecnologias Utilizadas

Virtualização: Hyper-V.

SO: Windows Server 2022 e Windows 10.

Ferramentas: Active Directory, Group Policy Management, PowerShell.

🏗️ Implementação Passo a Passo

Estrutura de OUs: Criei uma hierarquia baseada em departamentos (RH, Financeiro, TI) para facilitar a aplicação de políticas.

Delegação de Controle (O Diferencial): Em vez de usar a conta de Administrador para tudo, configurei uma conta de Operador.

Desafio: O operador precisava resetar senhas sem ter acesso total ao servidor.

Solução: Deleguei a permissão específica no AD e utilizei o módulo RSAT via PowerShell para contornar limitações de interface.

GPOs Aplicadas:

Mapeamento automático de drives de rede baseado no grupo do usuário.

Restrição de acesso ao CMD e Painel de Controle para usuários finais.


🗺️ Arquitetura do Ambiente

![Arquitetura do LAB](docs/Diagrama.png)

💻 Scripts em Destaque

Exemplo de comando usado para delegar o reset de senha
Set-ADAccountPassword "Usuario" -Reset -NewPassword $pass

Você pode encontrar o código completo [aqui](scripts/passwordChange).
