json.array!(@fam_attachments) do |fam_attachment|
  json.extract! fam_attachment, :id, :family_id, :image
  json.url fam_attachment_url(fam_attachment, format: :json)
end
