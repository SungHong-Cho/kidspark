class PhotosController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  http_basic_authenticate_with name: "skyseed", password:"12345", only: [:create]

  def index
    p request.format
    respond_to do |format|
      format.html {
        @tab_type = "photos"
        if(params[:show_type] == "find")
          @from_datetime = params[:datetimepicker1].to_time
   	  @to_datetime = params["datetimepicker2"].to_time
          @from_timestamp = @from_datetime.to_time.to_i
          @to_timestamp = @to_datetime.to_time.to_i

          @photos = Photo.where(:created_at => @from_timestamp..@to_timestamp).page(params[:page]).per(10)
        else
          @photos = Photo.all.page(params[:page]).per(10)
        end
      }
      format.js {
#        p request.headers
#        @photos = Photo.where(:created_at.gt => params[:last_update_time])
#        render js: @photos.to_json
         
        if(params[:show_type] == "find")
          @from_datetime = params[:datetimepicker1].to_time
   	  @to_datetime = params["datetimepicker2"].to_time
          @from_timestamp = @from_datetime.to_time.to_i
          @to_timestamp = @to_datetime.to_time.to_i

          @photos = Photo.where(:created_at => @from_timestamp..@to_timestamp).page(params[:page]).per(10)
        else
          @photos = Photo.all.page(params[:page]).per(10)
        end
      }
    end
  end

  def detail
    @tab_type = "photos"
    @photo = Photo.where(id: params[:id]).first
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.save

    respond_to do |format|
      format.json {render nothing: true}
    end
  end
end
