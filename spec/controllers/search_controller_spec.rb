require 'rails_helper'

describe SearchController do
  include SearchSupporter

  describe 'GET #index' do
    it "renders the index" do
      get :index
      expect(response).to render_template("index")
    end

  # Concern method: reset_session
    it "resets the page number" do
      get :index
      expect(session[:page]).to be(0)
    end

    it "resets the query" do
      get :index
      expect(session[:query]).to eq("")
    end
  end

  describe 'GET #show' do
    context "the next button was hit" do
      it "increases the page number by 1" do
        session[:page] = 0
        get :show, {commit: "Next"}
        expect(session[:page]).to be(1)
      end
    end

    context "the previous button was hit" do
      it "decreases the page number by 1" do
        session[:page] = 2
        get :show, {commit: "Previous"}
        expect(session[:page]).to be(1)
      end
    end

# Concern method
  describe "get_url" do
    it "sets the session query" do
    get :show
      expect get_url({"companies"=>[""], "levels"=>["Internship"], "categories"=>["Account+Management"], "locations"=>[""], "controller"=>"search","action"=>"show"}).to change(session[:query], "&level=Internship&category=Account+Management")
    end

    it "sets the session url" do
      get :show
      expect get_url({"companies"=>[""], "levels"=>["Internship"], "categories"=>["Account+Management"], "locations"=>[""], "controller"=>"search", "action"=>"show"}).to change(session[:url], "https://api-v2.themuse.com/jobs?page=0&level=Internship&category=Account+Management")
    end
  end

# Concern method
  describe "get_api_results" do
    it "returns results based off user search params" do
    get :show
      expect(get_api_results).to be_success
    end
  end

  end



end