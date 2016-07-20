class SearchController < ApplicationController
  include SearchSupporter

  def index
    session.clear
    session[:page] = 0
  end

  def show
    results = get_api_results(get_url(params))
    session[:page] += 1
    if request.xhr?
      render :show, layout: false, locals: {results: results}
    else
      render :show, layout: false, locals: {results: results}
    end
  end
end
