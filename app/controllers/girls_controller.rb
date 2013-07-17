class GirlsController < ApplicationController
  def index
    @girls = Girl.all
  end
end