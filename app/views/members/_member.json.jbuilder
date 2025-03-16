json.extract! member, :id, :name, :email, :phone, :last_signed_in, :access_expiry_date, :is_active, :created_at, :updated_at
json.url member_url(member, format: :json)
