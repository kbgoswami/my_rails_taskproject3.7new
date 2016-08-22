require 'rails_helper'

describe Product do
  context "when the product has comments" do
  	before do
  	  @product = Product.create!(name: "race bike")
  	  @user = User.create!(email: "kbgoswami@comcast.net", password: "kbg123")
  	  @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
  	  @product.comments.create!(rating: 5, user: @user, body: "Beautiful bike!")
  	  @product.comments.create!(rating: 3, user: @user, body: "Average bike!")
	end

	it "returns the average rating of all comments" do
		expect(@product.comments.average(:rating)).to eq 3
	end

	it "if not valid" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end

  end

  
end