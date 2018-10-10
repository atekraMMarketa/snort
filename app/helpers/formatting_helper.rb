module FormattingHelper
  def format_datetime(datetime, options)
    return unless datetime

    if options[:format] == :humanized
      datetime.strftime("%d.%m.%Y %k:%M")
    else
      datetime.strftime("%d.%m.%Y %T")
    end
  end
end