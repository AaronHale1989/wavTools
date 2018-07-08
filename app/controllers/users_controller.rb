class UsersController < ApplicationController
  def stripe_callback
    @user = User.find(current_user.id)
          options = {
            site: 'https://connect.stripe.com',
            authorize_url: '/oauth/authorize',
            token_url: '/oauth/token'
          }
          code = params[:code]
          client = OAuth2::Client.new("ca_D9oFSEDOLAMVCAfOedR4GJnhxBQq3BzC", "sk_test_eZTNWtbmz4CEr7wTQ4waGPsd", options)
          @resp = client.auth_code.get_token(code, :params => {:scope => 'read_write'})
          @access_token = @resp.token
          puts @resp.params["provider"]
          @user.update!(stripe_user_id: @resp.params["stripe_user_id"]) if @resp
          @user.update!(stripe_account_type: @resp.params["business_name"]) if @resp
          flash[:notice] = "Your account has been successfully created and is ready to process payments!"
 end


 def payment_profile
   @user = User.find(current_user.id)
    @account = Stripe::Account.retrieve("#{@user.stripe_user_id.to_s}") if @user.stripe_user_id.present?
    @balance = Stripe::Balance.retrieve() if @user.stripe_user_id.present?
    @user.update!(stripe_account_type: @account.business_url)
 end


end
