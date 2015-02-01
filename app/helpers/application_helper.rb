module ApplicationHelper

  def error_messages(obj)
    raw(obj.errors.full_messages.map{ |msg| content_tag(:div, content_tag(:button, raw('&times;'), class: 'close', :'data-dismiss' => 'alert') + msg, class: 'alert alert-error') }.join) if obj
  end

  def seo_content(context)
    context = context.to_sym unless context.is_a?(Symbol)
    @meta_tag_content[context]
  end

end
