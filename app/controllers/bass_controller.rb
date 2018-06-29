class BassController < ApplicationController
  def index
    @samples = Sample.where(category: "bass")
  end
end
