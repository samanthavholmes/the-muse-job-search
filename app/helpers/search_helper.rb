module SearchHelper

  def company_name(job_listing)
    job_listing["company"]["name"]
  end

  def levels(job_listing)
    levels = []
    job_listing["levels"].each do |level|
      levels << level["name"]
    end
    return levels
  end

  def job_title(job_listing)
    job_listing["name"]
  end

  def job_description(job_listing)
    render html: job_listing["contents"].html_safe
  end

  def categories(job_listing)
    categories = []
    job_listing["categories"].each do |category|
      categories << category["name"]
    end
    return categories
  end

  def locations(job_listing)
    locations = []
    job_listing["locations"].each do |location|
      locations << location["name"]
    end
    return locations
  end

  def url_for_full_listing(job_listing)
    job_listing["refs"]["landing_page"]
  end

  def listing_date(job_listing)
    (job_listing["publication_date"].to_datetime).strftime("%m/%d/%Y")
  end

end
