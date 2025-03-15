json.extract! user, :id, :name, :email, :phone, :last_signed_in, :access_expiry_date, :is_active, :created_at, :updated_at
json.url user_url(user, format: :json)
