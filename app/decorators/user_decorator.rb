class UserDecorator < Draper::Decorator
  delegate_all

  def welcome
    h.raw %Q(Welcome to "#{model.tenant.name}" #{name})
  end

  def name
    h.image_tag(model.details['info']['image']) +
      model.name
  end

  def provider_details
    info = h.content_tag :div do
      h.content_tag(:h2, 'Info')+
      definition_list(model.details['info'])
    end

    extra = h.content_tag(:div) do
      h.content_tag(:h2, 'Extra')+
      definition_list(model.details['extra'])
    end

    info + extra
  end

  def provider
    "Here is what #{model.provider.humanize} told us about you"
  end

private
  def definition_list(hash)
    h.content_tag :dl do
      hash.map do |key,value|
        h.content_tag(:dt, key) +
        h.content_tag(:dd, value)
      end.join.html_safe
    end
  end
end
