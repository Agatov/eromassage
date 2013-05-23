class Admin::GirlsController < AdminController
  def index
    @girls = Girl.order(:id)
  end

  def show
    @girl = Girl.find(params[:id])
  end

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new params[:girl]

    if @girl.save
      redirect_to admin_girls_path
    else
      render :new
    end
  end

  def edit
    @girl = Girl.find params[:id]
  end

  def update
    @girl = Girl.find params[:id]

    if @girl.update_attributes(params[:girl])
      redirect_to admin_girls_path
    else
      render :edit
    end
  end

  def destroy
    @girl = Girl.find params[:id]
    @girl.destroy
    redirect_to :back
  end

end