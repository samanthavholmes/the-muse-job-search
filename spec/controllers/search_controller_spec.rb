require 'rails_helper'

describe SearchController do
  include SearchSupporter

  describe 'GET #index' do
    it "renders the index" do
      get :index
      expect(response).to render_template("index")
    end

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
        session[:query] = ""
        get :show, {commit: "Next"}
        expect(session[:page]).to be(1)
      end
    end

    context "the previous button was hit" do
      it "decreases the page number by 1" do
        session[:page] = 2
        session[:query] = ""
        get :show, {commit: "Previous"}
        expect(session[:page]).to be(1)
      end
    end

  end



end