class MarketplacesController < ApplicationController

  def index
    @paids = Paid.all
  end
end
