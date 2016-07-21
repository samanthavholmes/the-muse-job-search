require 'open-uri'

module SearchSupporter

  def reset_session
    session[:page] = 0
    session[:query] = ""
  end

  def get_url(params)
    session[:url] = "https://api-v2.themuse.com/jobs?page=" + "#{session[:page]}" + "#{session[:query]}"
    if session[:query] == ""
      if params[:companies] && params[:companies] != [""]
        companies = params[:companies].map! {|c| c.gsub(" ", "+")}.join("&company=")
        company_query = "&company=" + companies
        session[:url] += company_query
        session[:query] += company_query
      end
      if params[:levels]
        levels = params[:levels].map! {|c| c.gsub(" ", "+")}.join("&level=")
        level_query = "&level=" + levels
        session[:url] += level_query
        session[:query] += level_query
      end
      if params[:categories]
        categories = params[:categories].map! {|c| c.gsub(" ", "+").gsub("&","%26")}.join("&category=")
        category_query = "&category=" + categories
        session[:url] += category_query
        session[:query] += category_query
      end
      if params[:locations] && params[:locations] != [""]
        locations = params[:locations].map! {|c| c.gsub(" ", "+").gsub(",","%2C")}.join("&location=")
        location_query = "&location=" + locations
        session[:url] += location_query
        session[:query] += location_query
      end
    end
    return session[:url]
  end

  def get_api_results(url)
    return JSON.parse(open(session[:url]).read)["results"]
  end
end