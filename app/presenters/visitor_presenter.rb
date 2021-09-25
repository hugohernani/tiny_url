class VisitorPresenter < BasePresenter
  def initialize(visitor:)
    super(visitor)
  end

  def column_row
    h.tag.tr do
      h.concat(
        h.tag.td(object.request_ip) +
        h.tag.td(object.visits)
      )
    end
  end
end
