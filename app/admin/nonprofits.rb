ActiveAdmin.register Nonprofit do
  index do
    column :name
    column :email
    column :info
    default_actions
  end

  show do
    URI.join root_url, user_omniauth_authorize_path(:stripe_connect, state: 'nonprofit-' + nonprofit.id.to_s)
  end
end
