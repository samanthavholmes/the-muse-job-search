class SearchController < ApplicationController

  def index
  end

  def show
    companies = params[:companies]
    levels = params[:levels]
    categories = params[:categories]
    locations = params[:locations]
    results = JSON.parse(open("https://api-v2.themuse.com/jobs" + "?api_key=c0dcae39a9dc75692b5529c4606f1d8c397d8098c4cce5d9b324b0d1ab7e75ea&page=0" + "&level=Entry+Level").read)
    if request.xhr?
      render :show, layout: false, locals: {results: results}
    end
  end
end