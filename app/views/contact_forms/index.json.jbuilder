json.array!(@contact_forms) do |contact_form|
  json.extract! contact_form, :email, :subject, :description, :first_name, :last_name
  json.url contact_form_url(contact_form, format: :json)
end
