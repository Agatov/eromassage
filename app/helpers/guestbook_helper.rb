module GuestbookHelper
  def get_next_page_number
    page = params[:page].to_i
    if page == 0
      2
    else
      page + 1
    end
  end
end