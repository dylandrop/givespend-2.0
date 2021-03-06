class AuthenticationsController < ApplicationController

  def facebook
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(auth_hash(omniauth))
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Welcome! You have signed up successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def twitter
    facebook
  end

  def stripe_connect
    omniauth = request.env["omniauth.auth"]
    if params['state'].try(:include?, 'nonprofit')
      Nonprofit.find_and_create_auth! params['state'], auth_hash(omniauth)
      redirect_to items_path, notice: "You're successfully set up with Givespend!"
    else
      current_user.authentications.create!(auth_hash(omniauth))
      flash[:notice] = "Authentication successful."
      redirect_to new_item_url
    end
  end

  private

  def auth_hash omniauth
    {:provider => omniauth['provider'], :uid => omniauth['uid'], :token => omniauth['credentials']['token']}
  end
end
