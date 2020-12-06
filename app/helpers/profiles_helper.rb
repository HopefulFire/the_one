module ProfilesHelper
  def unknown_if_nil(attribute)
    if attribute.nil?
      'Unknown'
    else
      attribute
    end
  end
end
