json.extract! funcionario, :id, :nome, :email, :dataNascimento, :user_id, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
