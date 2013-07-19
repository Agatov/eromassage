class Admin::ProgramsController < AdminController
  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new params[:program]
    @program.save

    redirect_to admin_programs_path
  end

  def edit
    @program = Program.find params[:id]
  end

  def update
    @program = Program.find params[:id]
    @program.update_attributes params[:program]

    redirect_to admin_programs_path
  end

  def destroy
    @program = Program.find params[:id]
    @program.destroy

    redirect_to admin_programs_path
  end
end