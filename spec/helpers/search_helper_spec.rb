require 'rails_helper'

describe "SearchHelper" do
  include SearchHelper

  let!(:job_listing) {{"locations"=>[{"name"=>"New York City Metro Area"}],
 "company"=>{"name"=>"Fueled", "id"=>162, "short_name"=>"fueled"},
 "short_name"=>"operations-intern-4677b6",
 "type"=>"external",
 "refs"=>{"landing_page"=>"https://www.themuse.com/jobs/fueled/operations-intern-4677b6"},
 "id"=>28540,
 "publication_date"=>"2015-11-17T22:07:10.501307Z",
 "categories"=>[{"name"=>"HR & Recruiting"}, {"name"=>"Operations"}],
 "name"=>"Operations Intern",
 "model_type"=>"jobs",
 "contents"=>
  "<p><strong>WHAT WE’RE UP TO</strong></p>\n<p>We're leading the charge in a world of apps that do stuff, and do it with style. It's no longer sufficient for brands to just throw out apps that 'delight' without much substance. We work with our clients – from small startups to big brands – to figure out how to achieve their marketing and business goals through smart, high-functioning apps and websites that genuinely engage their users and keep them coming back for more. We also run one of the top coworking spaces in Manhattan, located in the heart of Soho and featured in The New York Times. The Fueled Collective is home to over 30 startups, and boasts a well-stocked snack wall, a ping pong table, and incredible views of the Manhattan skyline.</p>\n<p>Here's a cool video showing what its like!</p>\n<p><strong>WHERE YOU FIT IN</strong> </p>\n<p>The Operations internship at Fueled is a 3-month long training program for college students interested in Human Resources and Recruiting. As an Operations intern, you will work closely with the Operations Manager and Talent Manager, and will gain a robust understanding of the activities involved in running day-to-day operations of a tech startup. You will gain valuable exposure to and experience in areas that include, but are not limited to, Human Resources, Recruiting, Orientation &amp; Training, Resourcing, Finance, and Process Documentation. Throughout the internship, you will be actively involved in the daily function of the company, and will build fundamental professional skills such as effective time management and organizational habits.</p>\n<p><strong>ROLES AND RESPONSIBILITIES FOR THE POSITION INCLUDE:</strong></p>\n<ul>\n<li>Helping to manage the pipeline for all of Fueled’s NYC-based technical/operational roles.</li>\n<li>Communicating with applicants through email, phone, ATS, and LinkedIn.</li>\n<li>Drafting, editing, and posting job requisitions in an on-brand voice.</li>\n<li>Supporting the Operations Manager with administrative tasks and special projects.</li>\n</ul>\n<p><strong>YOU WILL LEARN HOW TO:</strong></p>\n<ul>\n<li>Source candidates for tech industry roles using cutting-edge sourcing methods.</li>\n<li>Utilize third-party HR/recruiting platforms.</li>\n<li>Screen candidates.</li>\n<li>Perform HR functions including onboarding, payroll, resource management, and offboarding.</li>\n</ul>\n<p>The ideal candidate will be a quick learner and a hard worker with a positive attitude. An eagerness to learn and excitement for the tech industry is far more important than previous experience.</p>\n<p>Candidates must be able to receive college credit for this internship. </p>",
 "levels"=>[{"name"=>"Internship", "short_name"=>"internship"}],
 "tags"=>[]}
}

  describe "company_name" do
    it "returns the company name from the api results" do
      expect(company_name(job_listing)).to eq("Fueled")
    end
  end

  describe "levels" do
    it "returns an array of the job levels from the api results" do
      expect(levels(job_listing)).to eq ["Internship"]
    end
  end

  describe "job_title" do
    it "returns the job title from the api results" do
      expect(job_title(job_listing)).to eq "Operations Intern"
    end
  end

  describe "job_description" do
    it "renders the html results of the job description from the api results" do
      expect(job_description(job_listing)).to eq "<p><strong>WHAT WE’RE UP TO</strong></p>\n<p>We're leading the charge in a world of apps that do stuff, and do it with style. It's no longer sufficient for brands to just throw out apps that 'delight' without much substance. We work with our clients – from small startups to big brands – to figure out how to achieve their marketing and business goals through smart, high-functioning apps and websites that genuinely engage their users and keep them coming back for more. We also run one of the top coworking spaces in Manhattan, located in the heart of Soho and featured in The New York Times. The Fueled Collective is home to over 30 startups, and boasts a well-stocked snack wall, a ping pong table, and incredible views of the Manhattan skyline.</p>\n<p>Here's a cool video showing what its like!</p>\n<p><strong>WHERE YOU FIT IN</strong> </p>\n<p>The Operations internship at Fueled is a 3-month long training program for college students interested in Human Resources and Recruiting. As an Operations intern, you will work closely with the Operations Manager and Talent Manager, and will gain a robust understanding of the activities involved in running day-to-day operations of a tech startup. You will gain valuable exposure to and experience in areas that include, but are not limited to, Human Resources, Recruiting, Orientation &amp; Training, Resourcing, Finance, and Process Documentation. Throughout the internship, you will be actively involved in the daily function of the company, and will build fundamental professional skills such as effective time management and organizational habits.</p>\n<p><strong>ROLES AND RESPONSIBILITIES FOR THE POSITION INCLUDE:</strong></p>\n<ul>\n<li>Helping to manage the pipeline for all of Fueled’s NYC-based technical/operational roles.</li>\n<li>Communicating with applicants through email, phone, ATS, and LinkedIn.</li>\n<li>Drafting, editing, and posting job requisitions in an on-brand voice.</li>\n<li>Supporting the Operations Manager with administrative tasks and special projects.</li>\n</ul>\n<p><strong>YOU WILL LEARN HOW TO:</strong></p>\n<ul>\n<li>Source candidates for tech industry roles using cutting-edge sourcing methods.</li>\n<li>Utilize third-party HR/recruiting platforms.</li>\n<li>Screen candidates.</li>\n<li>Perform HR functions including onboarding, payroll, resource management, and offboarding.</li>\n</ul>\n<p>The ideal candidate will be a quick learner and a hard worker with a positive attitude. An eagerness to learn and excitement for the tech industry is far more important than previous experience.</p>\n<p>Candidates must be able to receive college credit for this internship. </p>"
    end
  end

  describe "locations" do
    it "returns an array of the job locations from the api results" do
      expect(locations(job_listing)).to eq ["New York City Metro Area"]
    end
  end


  describe "url_for_full_listing" do
    it "returns the url for the job listing on The Muse" do
      expect(url_for_full_listing(job_listing)).to eq "https://www.themuse.com/jobs/fueled/operations-intern-4677b6"
    end
  end

  describe "listing_date" do
    it "returns the listing date from the api results" do
      expect(listing_date(job_listing)).to eq "11/17/2015"
    end
  end
end