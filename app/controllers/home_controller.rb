class HomeController < ApplicationController
  def index
    @hash = Shop.marker_hash
  end
end
