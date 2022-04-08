# Jobs

O aplicativo permite que pessoas que trabalham na mesma empresa criem e gerenciem oportunidades de emprego e encontrem candidatos interessados nelas.

### :hammer: Status
_em desenvolvimento_

### :white_check_mark: Funcionalidades

* Funcionário cria conta usando e-mail corporativo, criando empresa
* Funcionário preenche os dados da empresa, se for a primeira pessoa da empresa a ingressar
* Visitante visualiza empresas cadastradas
* Visitante vê oportunidades de emprego
* Visitante cria conta candidata para confirmar a inscrição
* Candidato preenche currículo
* Funcionário da empresa vê as inscrições recebidas
* Visitantes, funcionários e candidatos buscam oportunidades de emprego por nome e por empresa
* Funcionário da empresa faz uma proposta de trabalho a um candidato
* O candidato vê as propostas recebidas
* O candidato pode aceitar ou rejeitar a proposta
* Funcionário aprova / desaprova a inscrição do candidato
* A oportunidade de trabalho é desativada quando o número necessário de candidatos é aprovado
* Sistema envia e-mail quando o Formulário de Candidatura é aceito

### :gem: Requisitos

* Ruby '3.0.0'
* Rails '~> 6.1.0'
* Node.js
* SQLite3

### Como rodar o projeto

Clone o projeto:

```bash
git clone https://github.com/leticiaoliveira5/jobs.git
```

Na pasta do projeto, instale as dependências:

```bash
bundle install
```

Para popular o banco de dados:

```bash
rake db:setup
```

Comando:

```bash
rails server
```

Agora você pode ver a aplicação no seu navegador, em http://localhost:3000/

### :key: Logins

#### candidates

  email: 'aline@mail.com', password: '123456'

  email: 'bianca@mail.com', password: '123456'

#### employees

  email: 'fatima@startv.com', password: '123456'

  email: 'monique@startv.com', password '123456'

  email: 'arthur@fly.com', password '123456'

### Testes

Com <code>rspec</code>

### :space_invader: Developer

  [/leticiaoliveira5](https://github.com/leticiaoliveira5)