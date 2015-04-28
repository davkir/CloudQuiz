module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger">

      <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> #{messages}
    </div>
    HTML

    html.html_safe
  end
end