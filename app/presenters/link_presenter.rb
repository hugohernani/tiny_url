class LinkPresenter < BasePresenter
  def initialize(link:)
    super(link)
  end

  def info_header
    link_opts = { target: '_blank', class: 'btn btn-info' }
    h.link_to(object.short_url, object.url, **link_opts)
  end

  private

  attr_reader :view_context
end
