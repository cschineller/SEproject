require 'rails_helper'

RSpec.describe "CRUDRoutes", type: :request do
    describe "go through index route" do
        it "should be successful" do
            get shows_path
            expect(response).to have_http_status(200) # <-- I see that it says this in documentation, still not sure what it means, so can someone look this over?
        end
    end

    describe "go through show route" do
        it "should be successful" do
            test_show = FactoryBot.create(:show, title: "test_show")
            get show_path(test_show.id)
            expect(response).to have_http_status(200) 
        end
        it "should not be successful, sad route" do
            get show_path(1000) # <-- this should not exist, since it is too high
            expect(response).to have_http_status(:redirect)
            expect(response).to redirect_to(shows_path) # shows or show path? I think shows since going back home
        end
    end

    describe "go through new route" do
        it "should be succcessful" do
            get new_show_path 
            expect(response).to have_http_status(200) 
        end
    end

    describe "go through create route" do
        it "should be succcessful" do

        end
    end

    describe "go through destroy route" do
        it "should be succcessful" do

        end
    end
end