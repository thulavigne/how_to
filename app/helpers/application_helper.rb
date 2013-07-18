module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "How-To").join(" - ")
      end
end end
end
