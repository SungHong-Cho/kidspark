class MobileFacilitiesController < ApplicationController
  def index
    respond_to do |format|
      format.html{
        redirect_to controller: "photos", action: "index"
      }
    end
  end
end
