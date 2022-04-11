module ApplicationHelper
  def display_alerts
    if notice
      render 'layouts/notice'
    elsif alert
      render 'layouts/alert'
    end
  end
end
