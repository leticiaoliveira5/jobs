<h1>Jobs</h1>

O aplicativo permite que pessoas que trabalham na mesma empresa criem e gerenciem oportunidades de emprego e encontrem candidatos interessados nelas.

## Status: 
:warning: em desenvolvimento

## Funcionalidades<

:heavy_check_mark: Funcionário cria conta usando e-mail corporativo, criando empresa
:heavy_check_mark: Funcionário preenche os dados da empresa, se for a primeira pessoa da empresa a ingressar
:heavy_check_mark: Visitante visualiza empresas cadastradas
:heavy_check_mark: Visitante vê oportunidades de emprego
:heavy_check_mark: Visitante cria conta candidata para confirmar a inscrição
:heavy_check_mark: Candidato preenche currículo
:heavy_check_mark: Funcionário da empresa vê as inscrições recebidas
:heavy_check_mark: Visitantes, funcionários e candidatos buscam oportunidades de emprego por nome e por empresa
:heavy_check_mark: Funcionário da empresa faz uma proposta de trabalho a um candidato
:heavy_check_mark: O candidato vê as propostas recebidas
:heavy_check_mark: O candidato pode aceitar ou rejeitar a proposta
:heavy_check_mark: Funcionário aprova / desaprova a inscrição do candidato
:heavy_check_mark: A oportunidade de trabalho é desativada quando o número necessário de candidatos é aprovado
:heavy_check_mark: Sistema envia e-mail quando o Formulário de Candidatura é aceito

## Requisitos:

:warning: Ruby '3.0.0'
:warning: Rails '~> 6.1.0'
:warnig: Node.js

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

Database populated via file <code>db/seeds.rb</code>
<br>Pre-saved logins:
<br>candidates:
<br>email: 'aline@mail.com', password: '123456'
<br>email: 'bianca@mail.com', password: '123456'
<br>employees:
<br>email: 'fatima@startv.com', password: '123456'
<br>email: 'monique@startv.com', password '123456'
<br>email: 'arthur@fly.com', password '123456'

## Testes

Com <code>rspec</code>

## Coded by Letícia Oliveira
