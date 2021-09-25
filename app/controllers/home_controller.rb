class HomeController < ApplicationController
  def new
    @form = LinkForm.new
  end
end
