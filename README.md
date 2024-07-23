# Sidekiq-Exemple 

Esta aplicação é um exemplo prático do uso do Sidekiq e do Sidekiq-Cron para gerenciar e agendar tarefas em background. Criada com o intuito de estudar e demonstrar a eficiência desses tools, a aplicação visa centralizar e generalizar a criação e execução de agendamentos de serviços. 

## Índice

- [Visão Geral](#visão-geral)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Uso](#uso)
- [Jobs e Agendamento](#jobs-e-agendamento)

## Visão Geral

Ela permite:

- **Execução de Jobs em Background**: Gerencie e processe tarefas assíncronas sem bloquear o fluxo principal da aplicação.
- **Agendamento de Tarefas**: Programe tarefas para execução futura, seja para um momento específico ou de forma periódica.
- **Interface Web do Sidekiq**: Acesse uma interface intuitiva para monitorar o status e o progresso dos jobs.

A aplicação foi projetada para fornecer uma solução robusta e escalável para o gerenciamento de tarefas em segundo plano, utilizando a flexibilidade e o poder de agendamento do Sidekiq e Sidekiq-Cron.


## Pré-requisitos

Antes de começar, verifique se você tem as seguintes dependências instaladas:

- Ruby (versão 3.3.0 ou superior)
- Rails (versão 7.0.2 ou superior)
- PostgreSQL
- Redis
- Docker (opcional, se estiver usando containers)

## Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/usuario/repositorio.git
   cd repositorio

Instale as dependências:

bash

bundle install

Configure o banco de dados:

bash

rails db:create
rails db:migrate

(Opcional) Se estiver usando Docker, inicie os containers:

bash

    docker-compose up



### Configuração do Redis e Sidekiq:

Certifique-se de que o Redis esteja em execução. Se estiver usando Docker, ele será iniciado automaticamente com o Compose.

Configuração do Sidekiq-Cron:

Edite o arquivo config/schedule.yml para definir seus jobs periódicos.

Exemplo de schedule.yml:

    yaml

    # config/schedule.yml
    my_periodic_job:
      cron: "0 9 * * *"  # Executa todos os dias às 09:00
      class: "MyPeriodicJob"
      args:
        - "argument1"
        - "argument2"

Configuração das Variáveis de Ambiente:

Defina as variáveis de ambiente necessárias para sua aplicação no arquivo .env ou diretamente no ambiente.

Uso

Iniciar o Servidor Rails:

bash

    rails server

Acessar a Interface do Sidekiq:

Se estiver usando a interface web do Sidekiq, você pode acessá-la em http://localhost:3000/sidekiq (ou a porta configurada).

Enfileirar Jobs:

Para enfileirar jobs, você pode usar a classe SchedulerJobManager. Exemplo:

ruby

    SchedulerJobManager.enqueue(MyJob, arg1, arg2)
    SchedulerJobManager.schedule_in(MyJob, 10.minutes.from_now, arg1, arg2)
    SchedulerJobManager.schedule_at(MyJob, Time.now + 1.day, arg1, arg2)
    SchedulerJobManager.schedule_recurring(MyJob, cron_expression: '0 9 * * *', arg1, arg2)

Jobs e Agendamento
Definição de Jobs

Crie jobs no diretório app/jobs utilizando Sidekiq::Worker.

Exemplo de Job:

ruby

# app/jobs/my_job.rb
class MyJob
  include Sidekiq::Worker

  def perform(*args)
    # Lógica do job
  end
end

Agendamento de Jobs

    Imediato: SchedulerJobManager.enqueue(MyJob, arg1, arg2)
    Atrasado: SchedulerJobManager.schedule_in(MyJob, 10.minutes.from_now, arg1, arg2)
    Específico: SchedulerJobManager.schedule_at(MyJob, Time.now + 1.day, arg1, arg2)
    Periódico: SchedulerJobManager.schedule_recurring(MyJob, cron_expression: '0 9 * * *', arg1, arg2)
