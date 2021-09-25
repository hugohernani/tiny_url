class HomeController < ApplicationController
  def new
    @link = Link.new
  end
end
