require 'rails_helper'

describe SearchSupporter do
  include SearchSupporter

 describe "get_url" do
    it "returns the url and the query from the user search params" do
      expect get_url({companies: [""], levels: ["Internship"]}, "", 0).to be(["https://api-v2.themuse.com/jobs?page=0&level=Internship", "&level=Internship"])
    end
  end

  describe "get_api_results" do
    it "returns results based off user search params" do
      expect(get_api_results("https://api-v2.themuse.com/jobs?page=0&level=Internship")).to be_success
    end
  end

end