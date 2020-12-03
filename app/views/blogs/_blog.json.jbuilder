json.extract! blog, :id, :titulo, :mensagem, :usuario, :data, :created_at, :updated_at
json.url blog_url(blog, format: :json)
