class GirlsController < ApplicationController
  def show
    @girl = Girl.find params[:id]
  end
end