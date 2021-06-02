class SchedulesRepresenter
  def initialize(schedules, useDate = false, page = 1)
    @schedules = schedules_map(schedules)
    @useDate = useDate
    @page = page
  end

  def as_json
    schedule_groups = []
    if useDate
      end_of_week = Date.today.end_of_week(:monday)
      start_date = page == 1 ? Date.today : end_of_week+(1+(page-2)*7)
      end_date = page == 1 ? end_of_week : end_of_week+((page-1)*7)
      (start_date..end_date).each do |d|
        day = d.strftime('%A')
        schedule_groups<< {date: d.iso8601, day: day, schedules: schedules.select { |s| s[:day_name] == day } }
      end
    else
      Date::DAYNAMES.each do |day|
        schedule_groups<< {day: day, schedules: schedules.select { |s| s[:day_name] == day } }
      end
    end
    schedule_groups
  end

  private
  attr_reader :schedules, :useDate, :page

  def schedules_map(schedules = [])
    schedules.map { |s| ScheduleRepresenter.new(s).as_json }
  end
end