json.extract! question, :id, :user, :question, :created_at, :updated_at
json.url question_url(question, format: :json)
