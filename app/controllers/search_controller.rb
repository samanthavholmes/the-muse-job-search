class SearchController < ApplicationController
  include SearchSupporter

  def index
    reset_session
  end

  def show
    if params[:commit] == "Next"
      session[:page] += 1
    elsif params[:commit] == "Previous"
      session[:page] -= 1
    end
    results = get_api_results(get_url(params))
    if request.xhr?
      render :show, layout: false, locals: {results: results}
    else
      render :show, locals: {results: results}
    end
  end
end
