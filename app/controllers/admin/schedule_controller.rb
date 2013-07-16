class Admin::ScheduleController < AdminController
  before_filter :define_calendar_and_today

  def index
    @girl = Girl.find params[:girl_id]
    @working_days = get_working_days
    
    @calendar_group_by_week = @calendar.group_by{|date| date.cweek}
  end

  def update
    @girl = Girl.find params[:girl_id]
    build_schedule_for_girl
    @girl.save
    delete_from_schedule_if_need @calendar

    redirect_to admin_girl_schedule_path(@girl), notice: t('changes_saved')
  end
private
  def define_calendar_and_today
    @today = Date.today
    @calendar = get_calendar @today
  end

  def get_schedules_arr_from_params
    res = []
    params[:schedule].each {|schedule, val| res << schedule if val.to_i == 1}
    res
  end

  def delete_from_schedule_if_need calendar
    actual = @girl.schedules.where 'worked_on >= :start_date AND worked_on <= :end_date', {start_date: calendar.first, end_date: calendar.last}
    actual.each {|record| record.destroy unless get_schedules_arr_from_params.include? record.worked_on.to_s}
  end

  def get_working_days
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