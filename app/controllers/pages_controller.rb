class PagesController < ApplicationController
  def home
  end

  def sms
    params.to_json
  end
end
