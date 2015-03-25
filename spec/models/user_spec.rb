require 'rails_helper'

describe User do

    

    describe "#favorited(trail)" do

      before do
        @user = create(:user)
        trail = create(:trail, user: @user)
      end

      it "returns `nil` if the user has not favorited the trail" do
        expect ( User.favorited(trail)).to eq nil
      end

      it "returns the appropriate favorite if it exists" do
      end
    end

end
