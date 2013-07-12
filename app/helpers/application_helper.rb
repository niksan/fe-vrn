module ApplicationHelper

  def include_gritter
    css = stylesheet_link_tag 'gritter/jquery.gritter'
    js = javascript_include_tag 'gritter/jquery.gritter.min'
    css + js
  end

end
