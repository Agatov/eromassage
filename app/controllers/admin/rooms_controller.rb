class Admin::RoomsController < AdminController
  def index
    @rooms = Room.order(:id)
  end

  def show
    @room = Room.find params[:id]
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params[:room])

    if @room.save
      redirect_to admin_rooms_path
    else
      render :new
    end
  end

  def edit
    @room = Room.find params[:id]
  end

  def update
    @room = Room.find params[:id]

    if @room.update_attributes(params[:room])
      redirect_to admin_rooms_path
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find params[:id]
    @room.destroy
    redirect_to admin_rooms_path
  end

end