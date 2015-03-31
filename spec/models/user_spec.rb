require 'rails_helper'

describe User do

    

    describe "#favorited(trail)" do

      before do
        @user = create(:user)
        @trail = create(:trail, user: @user)
      end

      it "returns `nil` if the user has not favorited the trail" do
        expect( @user.favorited(@trail)).to eq nil
      end

      it "returns the appropriate favorite if it exists" do
        favorite = @user.favorites.create(trail: @trail)

        expect(@user.favorited(@trail)).to eq favorite
      end

      it "returns nil if trail was unfavorited" do
        favorite = @user.favorites.create(trail: @trail)
        expect(@user.favorited(@trail)).to eq favorite
        
        favorite.destroy
        expect(@user.favorited(@trail)).to eq nil
      end
    end

end
