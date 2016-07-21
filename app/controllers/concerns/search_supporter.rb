require 'open-uri'

module SearchSupporter

  def reset_session
    session[:page] = 0
    session[:query] = ""
  end

  def get_url
    if session[:query] == ""
      if params[:companies] && params[:companies] != [""]
        companies = params[:companies].map! {|c| c.gsub(" ", "+")}.join("&company=")
        company_query = "&company=" + companies
        session[:query] += company_query
      end
      if params[:levels]
        levels = params[:levels].map! {|c| c.gsub(" ", "+")}.join("&level=")
        level_query = "&level=" + levels
        session[:query] += level_query
      end
      if params[:categories]
        categories = params[:categories].map! {|c| c.gsub(" ", "+").gsub("&","%26")}.join("&category=")
        category_query = "&category=" + categories
        session[:query] += category_query
      end
      if params[:locations] && params[:locations] != [""]
        locations = params[:locations].map! {|c| c.gsub(" ", "+").gsub(",","%2C")}.join("&location=")
        location_query = "&location=" + locations
        session[:query] += location_query
      end
    end
    session[:url] = "https://api-v2.themuse.com/jobs?page=" + "#{session[:page]}" + "#{session[:query]}"
    return session[:url]
  end

  def get_api_results(url)
    return JSON.parse(open(session[:url]).read)["results"]
  end
end