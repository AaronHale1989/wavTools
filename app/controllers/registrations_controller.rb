class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!


def authenticate_scope!
    send(:"authenticate_user!", force: true)
    self.resource = send(:"current_user")
  end

private

def sign_up_params
  params.require(:user).permit( :username,
                                :email,
                                :password,
                                :password_confirmation)
end

def account_update_params
  params.require(:user).permit( :username,
                                :email,
                                :password,
                                :password_confirmation,
                                :current_password)
end





end
