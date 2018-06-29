class MembersController < ApplicationController
  def show
    @person = User.find(current_user.id)
  end
end
