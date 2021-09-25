module LinksHelper
  def decorate_visitors(visitors)
    visitors.map{ |v| VisitorPresenter.new(visitor: v) }
  end
end
