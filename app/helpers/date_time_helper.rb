module DateTimeHelper
  def date_time_long(at)
    I18n.l(at.to_datetime, format: :long)
  end

  def date_time(at)
    I18n.l(at.to_datetime, format: :default)
  end

  def date_long(at)
    I18n.l(at.to_date, format: :long)
  end

  def date(at)
    I18n.l(at.to_date, format: :default)
  end
end
