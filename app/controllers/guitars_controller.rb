class GuitarsController < ApplicationController
  def index
    @samples = Sample.where(category: "guitars")
  end
end
