class DrumsController < ApplicationController
  def index
    @samples = Sample.where(category: "drums")
  end
end
