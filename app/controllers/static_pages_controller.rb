class StaticPagesController < ApplicationController
  def index
  end
  
  def landing_page
    @featured_product = Product.first
    @products = Product.limit(4)
  end

  def thank_you
    #ActionMailer::Base.mail(:from => @email,
      #:to => 'kbgoswami@comcast.net',
      #:subject => "A new contact form message from #{@name}",
      @name = params[:name]
      @email = params[:email]
      @message = params[:message]
      UserMailer.contact_form(@email, @name, @message).deliver_now  
  end
end
