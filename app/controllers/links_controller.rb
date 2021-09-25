class LinksController < ApplicationController
  def create
    @form = LinkForm.new(link_params)
    if @form.valid?
      link = Link.shorten(url: @form.url)
      redirect_to info_link_path(short_url: link.short_url)
    else
      render template: 'home/new', status: :unprocessable_entity
    end
  end

  def show
    Link.increase_visit(short_url: link.short_url, request_ip: request.ip)
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
