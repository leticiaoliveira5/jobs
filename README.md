<h1>Jobs</h1>

O aplicativo permite que pessoas que trabalham na mesma empresa criem e gerenciem oportunidades de emprego e encontrem candidatos interessados nelas.

## Status: 
:warning: em desenvolvimento

## Funcionalidades

* [x] Funcionário cria conta usando e-mail corporativo, criando empresa
* [x] Funcionário preenche os dados da empresa, se for a primeira pessoa da empresa a ingressar
* [x] Visitante visualiza empresas cadastradas
* [x] Visitante vê oportunidades de emprego
* [x] Visitante cria conta candidata para confirmar a inscrição
* [x] Candidato preenche currículo
* [x] Funcionário da empresa vê as inscrições recebidas
* [x] Visitantes, funcionários e candidatos buscam oportunidades de emprego por nome e por empresa
* [x] Funcionário da empresa faz uma proposta de trabalho a um candidato
* [x] O candidato vê as propostas recebidas
* [x] O candidato pode aceitar ou rejeitar a proposta
* [x] Funcionário aprova / desaprova a inscrição do candidato
* [x] A oportunidade de trabalho é desativada quando o número necessário de candidatos é aprovado
* [x] Sistema envia e-mail quando o Formulário de Candidatura é aceito

## Requisitos:

:warning: Ruby '3.0.0'

:warning: Rails '~> 6.1.0'

:warning: Node.js

:warning: SQLite3

## Como rodar o projeto

Clone o projeto:

<p><code>git clone https://github.com/leticiaoliveira5/jobs.git</code></p>

Na pasta do projeto, instale as dependências:

<p><code>bundle install</code></p>

Para popular o banco de dados:

<p><code>rake db:setup</code></p>

Comando:

<p><code>rails server</code></p>

Agora você pode ver a aplicação no seu navegador, na url http://localhost:3000/

## Seeds

Logins:

  candidates:

    email: 'aline@mail.com', password: '123456'

    email: 'bianca@mail.com', password: '123456'

  employees:

    email: 'fatima@startv.com', password: '123456'

    email: 'monique@startv.com', password '123456'

    email: 'arthur@fly.com', password '123456'

## Testes

Com <code>rspec</code>

