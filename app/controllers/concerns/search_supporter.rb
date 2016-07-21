require 'open-uri'

module SearchSupporter

  def get_url(options, query, page)
    if query == ""
      if options[:companies] && options[:companies] != [""]
        companies = options[:companies].map! {|c| c.gsub(" ", "+")}.join("&company=")
        company_query = "&company=" + companies
        query += company_query
      end
      if options[:levels]
        levels = options[:levels].map! {|c| c.gsub(" ", "+")}.join("&level=")
        level_query = "&level=" + levels
        query += level_query
      end
      if options[:categories]
        categories = options[:categories].map! {|c| c.gsub(" ", "+").gsub("&","%26")}.join("&category=")
        category_query = "&category=" + categories
        query += category_query
      end
      if options[:locations] && options[:locations] != [""]
        locations = options[:locations].map! {|c| c.gsub(" ", "+").gsub(",","%2C")}.join("&location=")
        location_query = "&location=" + locations
        query += location_query
      end
    end
    url = "https://api-v2.themuse.com/jobs?page=" + page.to_s + query
    return [url, query]
  end

  def get_api_results(url)
    return JSON.parse(open(url).read)["results"]
  end
end