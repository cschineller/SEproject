require 'rails_helper'

RSpec.describe Show, type: :model do
  describe "show name lookup" do
    it "should work  if there are no shows in database" do
      expect(Show.title_search("test")).to eq([])
    end
    
    it "should work correctly when one shows matches search" do
      one = FactoryBot.create(:show, title: "showOne")
      two = FactoryBot.create(:show, title: "showTwo")
      three = FactoryBot.create(:show, title: "showThree")

      expect(Show.title_search("showTwo")).to eq([two])
    end

    it "should work correctly when multiple shows match search fragment" do
      one = FactoryBot.create(:show, title: "showOne")
      two = FactoryBot.create(:show, title: "showTwo")
      three = FactoryBot.create(:show, title: "showTwentyTwo")
      expect(Show.title_search("TWO")).to match_array([two,three])
    end

  end
end