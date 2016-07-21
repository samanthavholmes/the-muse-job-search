class SearchController < ApplicationController
  include SearchSupporter

  def index
    session[:page] = 0
    session[:query] = ""
  end

  def show
    if params[:commit] == "Next"
      session[:page] += 1
    elsif params[:commit] == "Previous"
      session[:page] -= 1
    end
    query = session[:query]
    page = session[:page]
    url = get_url( { companies: params[:companies],
                     levels: params[:levels],
                     categories: params[:categories],
                     locations: params[:locations]
                    },
                    query,
                    page )
    session[:query] = url[1]
    results = get_api_results(url[0])
    if request.xhr?
      render :show, layout: false, locals: {results: results}
    else
      render :show, locals: {results: results}
    end
  end
end
