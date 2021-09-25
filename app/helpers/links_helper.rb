module LinksHelper
  def decorate_visitors(visitors)
    presenters = visitors.map{ |v| VisitorPresenter.new(visitor: v) }
    block_given? ? yield(presenters) : presenters
  end
end
