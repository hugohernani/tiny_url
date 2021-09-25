class Link < ApplicationRecord
  # FIXME: Provide a better string generator
  def self.shorten(url:)
    short_url = SecureRandom.urlsafe_base64(6).downcase
    create(url: url, short_url: short_url)
  end
end
