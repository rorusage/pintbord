module ApplicationHelper
  def notice_message
    alert_types = { notice: :success, alert: :danger}
    close_button_options = {class: "close", "data-dismiss" => "alert", "aria-hidden" => true}
    close_button = content_tag(:button, "x", close_button_options)

    alert = flash.map do |type, message|
      alert_type = alert_types[type.to_sym] || type
      alert_content = close_button + message
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      p alert_class

      content_tag(:div, alert_content, class: alert_class)
    end

    alert.join("\n").html_safe
  end
end
