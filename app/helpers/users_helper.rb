module UsersHelper

  # Returns the Gravatar for the given user.
  # before_save {if self.email.present? then self.email = email.downcase end}
  def gravatar_for(user, options = { size: 80 })
    if user.email.present?
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.user_name, class: "gravatar")
    else
      user_url = user.provider
      image_tag(user_url, alt: user.user_name, size: 80, class: "gravatar")
    end
    # gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # size = options[:size]
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # image_tag(gravatar_url, alt: user.user_name, class: "gravatar")
  end
end
