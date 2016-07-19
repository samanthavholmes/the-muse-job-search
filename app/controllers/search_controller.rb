class SearchController < ApplicationController
  include SearchSupporter

  def index
  end

  def show
    results = get_api_results(get_url(params))
    if request.xhr?
      render :show, layout: false, locals: {results: results}
    end
  end
end
