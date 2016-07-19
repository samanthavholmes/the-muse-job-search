require 'open-uri'

module SearchSupporter

  def get_url(params)
    url = "https://api-v2.themuse.com/jobs?page=0"
    if params[:companies] != [""]
      companies = params[:companies].map! {|c| c.gsub(" ", "+")}.join("&company=")
      company_query = "&company=" + companies
      url += company_query
    end
    if params[:levels]
      levels = params[:levels].map! {|c| c.gsub(" ", "+")}.join("&level=")
      level_query = "&level=" + levels
      url += level_query
    end
    if params[:categories]
      categories = params[:categories].map! {|c| c.gsub(" ", "+").gsub("&","%26")}.join("&category=")
      category_query = "&category=" + categories
      url += category_query
    end
    if params[:locations] != [""]
      locations = params[:locations].map! {|c| c.gsub(" ", "+").gsub(",","%2C")}.join("&location=")
      location_query = "&location=" + locations
      url += location_query
    end
    return url
  end

  def get_api_results(url)
    return JSON.parse(open(url).read)["results"]
  end
end