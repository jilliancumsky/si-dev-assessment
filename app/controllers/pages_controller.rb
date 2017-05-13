class PagesController < ApplicationController
  def home
  end

  def sms
    params.to_json
    
    require 'twilio-ruby'

    account_sid = "AC52b7a7b1dbc9a3317d317f0dfb7fa570" # Your Account SID from www.twilio.com/console
    auth_token = "51ea9facdc4cb54e23b8bdfd942600fc"   # Your Auth Token from www.twilio.com/console
    
    message = params[:message]
    begin
      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.account.messages.create(
        :body => params[:message],
        :to => "+1"+params[:number],    # Replace with your phone number
        :from => Rails.application.secrets.twilio_number)  # Replace with your Twilio number
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
  end
  
end
