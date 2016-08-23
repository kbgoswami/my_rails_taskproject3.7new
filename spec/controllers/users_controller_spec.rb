require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    #@user = User.create!(email: "john@comcast.net", password: "abcdefg")
    @user = FactoryGirl.create(:user)
    #@user_two = User.create!(email: "john2@comcast.net", password: "abcdefgh")
    @user_two = FactoryGirl.create(:user)

  end

  describe "GET #show" do
    context "User is logged in" do
        before do 
          sign_in @user
        end

        context "loads correct user details" do 
          before do
            get :show, id: @user.id
          end

          it "responds successfully with an HTTP 200 status code" do 
            expect(response).to be_success
            expect(response).to have_http_status(200)
          end  
        
          it "assigned user is the created user" do 
            expect(assigns(:user)).to eq @user
          end
        end

        context "Different user" do
          it "redirects to login page" do
            get :show, id: @user_two.id
            expect(response).to redirect_to(root_path) 
          end
        end
    end


      context "No user is logged in" do
          it "redirects to login" do
            get :show, id: @user.id
            expect(response).to redirect_to("/login")
        end
      end
  end
end