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
    build_schedule_for_girl
    if @girl.save
      redirect_to admin_girls_path
    else
      render :new
    end
  end

  def edit
    @girl = Girl.includes(:schedules).find params[:id]
    @working_days = build_working_days
    @today = Date.today
    calendar = get_calendar @today
    @calendar_group_by_week = calendar.group_by{|date| date.cweek}
  end

  def update
    @girl = Girl.find params[:id]
    build_schedule_for_girl
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
private
  def build_working_days
    working_days = []
    @girl.schedules.each {|schedule| working_days << schedule.worked_on.to_s}
    working_days
  end

  def build_schedule_for_girl
    if params[:schedule] != nil and params[:schedule].any?
      params[:schedule].each {|schedule, val| @girl.schedules.build worked_on: schedule.to_date if val.to_i == 1 && Schedule.new(girl_id: @girl.id, worked_on: schedule.to_date).valid?}
    end
  end

  def get_calendar date_obj
    from =  date_obj.at_beginning_of_month
    to = from.end_of_month
    next_month = from.next_month

    body_calendar = (from..to).to_a

    unless from.wday == 1
      prev = from.prev_month.end_of_month
      before_calendar = (from.beginning_of_week..prev).to_a
    end
    before_calendar ||= []
    unless to.wday == 0
      days_end_week = 7 - to.wday
      after_calendar = (next_month..next_month.next_day(days_end_week-1)).to_a
    end
    after_calendar ||= []

    before_calendar + body_calendar + after_calendar
  end
end