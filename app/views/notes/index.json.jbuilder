json.array!(@notes) do |note|
  json.extract! note, :id, :user_id, :content
  json.url note_url(note, format: :json)
end
