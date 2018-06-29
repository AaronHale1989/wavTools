class VocalsController < ApplicationController
  def index
    @samples = Sample.where(category: "vocals")
  end
end
