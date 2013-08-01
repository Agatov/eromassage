class ProgramsController < ApplicationController
  def index
    @programs = Program.filter params[:programs_filter]
  end
end