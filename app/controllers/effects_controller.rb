class EffectsController < ApplicationController
  def index
    @samples = Sample.where(category: "effects")
  end
end
