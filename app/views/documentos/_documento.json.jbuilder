json.extract! documento, :id, :nome, :descricao, :titulo, :brasao, :autor_id, :orgao_id, :visibilidade, :created_at, :updated_at
json.url documento_url(documento, format: :json)
