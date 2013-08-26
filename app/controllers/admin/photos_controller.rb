class Admin::PhotosController < AdminController

  def create
    if params[:girl_id]
      @girl = find_girl
      @photo = Photo.new params[:photo]

      respond_to do |format|
        if @photo.save
          @girl.photos << @photo
          format.js {
            render text: render_to_string(partial: 'admin/common/photo', locals: {photo: @photo})
          }
        else
          format.js {
            render text: ''
          }
        end
      end
    elsif params[:room_id]
      @room = find_room
      @photo = Photo.new params[:photo]

      respond_to do |format|
        if @photo.save
          @room.photos << @photo

          format.js {
            render text: render_to_string(partial: 'admin/common/photo', locals: {photo: @photo})
          }
        else
          format.js {
            render text: ''
          }
        end
      end
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    render json: {status: :ok}
  end

  private

  def find_girl
    Girl.find(params[:girl_id])
  end

  def find_room
    Room.find params[:room_id]
  end

  def find_photo

  end
end