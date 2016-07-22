class SearchController < ApplicationController
  include SearchSupporter

  def index
    #reset session
    session[:page] = 0
    session[:query] = ""
  end

  def show
    # increase/decrease page count for next api call if user hits next/previous
    if params[:commit] == "Next"
      session[:page] += 1
    elsif params[:commit] == "Previous"
      session[:page] -= 1
    end
    query = session[:query]
    page = session[:page]
    # get url from user search queries, pass in current query and page number
    url = get_url( { companies: params[:companies],
                     levels: params[:levels],
                     categories: params[:categories],
                     locations: params[:locations]
                    },
                    query,
                    page )
    session[:query] = url[1]
    # make api call from url
    results = get_api_results(url[0])
    if request.xhr?
      render :show, layout: false, locals: {results: results}
    else
      render :show, locals: {results: results}
    end
  end
end
