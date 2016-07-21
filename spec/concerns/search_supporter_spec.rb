require 'rails_helper'
require 'spec_helper'

describe "SearchSupporter" do
  include SearchSupporter

  describe "reset_session" do
    it "resets the page number" do
      reset_session
      expect(session[:page]).to be(0)
      # expect(reset_session).to change(session[:page], 0)
    end

    it "resets the query" do
      expect(session[:query]).to eq("")
    end
  end

  describe "get_url" do
    it "sets the session query" do

    end

    it "sets the session url" do

    end
  end

  describe "get_api_results" do
    it "returns results based off user search params" do
      expect(get_api_results("https://api-v2.themuse.com/jobs?level=Internship&page=0")).to be_success
    end
  end

end
