module StyleGuide
  module ApplicationHelper
    def escape_for_display(content)
      content.gsub(/\</, "&lt;").gsub(/\>/, "&gt;").html_safe
    end
  end
end
