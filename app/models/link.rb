class Link < ApplicationRecord
  has_many :visitors, dependent: :destroy

  # FIXME: Provide a better string generator
  def self.shorten(url:)
    short_url = SecureRandom.urlsafe_base64(6).downcase
    create(url: url, short_url: short_url)
  end

  def self.increase_visit(short_url:, request_ip:)
    link = find_by!(short_url: short_url)

    visitor = link.visitors.find_or_create_by(request_ip: request_ip)
    visitor.increment!(:visits)
    link
  end
end
