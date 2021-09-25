class LinksController < ApplicationController
  def create
    Link.create(link_params)
  end

  def show
    redirect_to link.url
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def link
    @link ||= Link.find_by!(short_url: params[:short_url])
  end
end
