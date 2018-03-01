module ViewShowErrorMessagesHelper

  def show_flash_error_messages!
    return "" if flash[:alert].blank?

    # messages = flash[:alert].map { |msg| content_tag(:li, msg) }.join
    # sentence = I18n.t("errors.messages.not_saved",
    #                   count: resource.errors.count,
    #                   resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class='alert alert-danger'>
      <ul>#{flash[:alert]}</ul>
    </div>
    HTML

    html.html_safe
  end
end
