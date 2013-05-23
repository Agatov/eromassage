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
    end
  end

  private

  def find_girl
    Girl.find(params[:girl_id])
  end

  def find_photo

  end
end