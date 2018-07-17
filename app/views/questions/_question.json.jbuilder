json.question do
  json.id question.id
  json.content question.content
  json.created_at question.created_at
  json.updated_at question.updated_at
end

json.answer do
  json.id question.answer.id
  json.question_id question.answer.question_id
  json.content question.answer.content
  json.created_at question.answer.created_at
  json.updated_at question.answer.updated_at
end

json.url question_url(question, format: :json)
