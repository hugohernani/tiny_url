module Links
  class StatisticsController < ApplicationController
    def show
      link
    end

    private

    def link
      @link ||= Link.find_by!(short_url: params[:short_url])
    end
  end
end
