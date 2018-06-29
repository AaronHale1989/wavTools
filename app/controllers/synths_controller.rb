class SynthsController < ApplicationController
  def index
    @samples = Sample.where(category: "synths")
  end
end
