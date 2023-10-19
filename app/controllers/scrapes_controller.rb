# frozen_string_literal: true

class ScrapesController < ApplicationController
  before_action :require_user

  def index
    @scrapes = current_user.scrapes.paginate(page: params[:page])
  end

  def show
    @scrape = current_user.scrapes.find_by(id: params[:id])

    if @scrape
      @scrape_links = @scrape.scrape_links.paginate(page: params[:page], per_page: 20)
    else
      flash[:alert] = t('controllers.scrape_not_found')
      redirect_to root_path
    end
  end

  def create
    scrape = current_user.scrapes.build(url: params[:url])

    flash[:alert] = scrape.errors.full_messages unless scrape.save

    redirect_to root_path
  end
end
