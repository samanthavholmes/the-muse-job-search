require 'open-uri'

module SearchSupporter

  def get_url(params)
    session[:url] = "https://api-v2.themuse.com/jobs?page=" + "#{session[:page]}"
    if !session[:query]
      if params[:companies] != [""]
        companies = params[:companies].map! {|c| c.gsub(" ", "+")}.join("&company=")
        company_query = "&company=" + companies
        session[:query] = true
        session[:url] += company_query
      end
      if params[:levels]
        binding.pry
        levels = params[:levels].map! {|c| c.gsub(" ", "+")}.join("&level=")
        level_query = "&level=" + levels
        session[:query] = true
        session[:url] += level_query
      end
      if params[:categories]
        categories = params[:categories].map! {|c| c.gsub(" ", "+").gsub("&","%26")}.join("&category=")
        category_query = "&category=" + categories
        session[:query] = true
        session[:url] += category_query
      end
      if params[:locations] != [""]
        locations = params[:locations].map! {|c| c.gsub(" ", "+").gsub(",","%2C")}.join("&location=")
        location_query = "&location=" + locations
        session[:query] = true
        session[:url] += location_query
      end
    end
    return session[:url]
  end

  def get_api_results(url)
    return JSON.parse(open(session[:url]).read)["results"]
  end
end