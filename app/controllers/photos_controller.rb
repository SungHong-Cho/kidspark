class PhotosController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  http_basic_authenticate_with name: "skyseed", password:"12345", only: [:create]

  def index
    respond_to do |format|
      format.html {
        @tab_type = "photos"
        if(params[:show_type] == "find")
          @from_datetime = params[:datetimepicker1].to_time
          @to_datetime = params["datetimepicker2"].to_time
          @from_timestamp = @from_datetime.to_time.to_i
          @to_timestamp = @to_datetime.to_time.to_i

          @photos = Photo.where(:created_at => @from_timestamp..@to_timestamp).desc(:created_at).page(params[:page]).per(10)
        else
          @photos = Photo.all.desc(:created_at).page(params[:page]).per(10)
        end
      }
     
      format.mobile {
        redirect_to controller: "mobile_facilities", action: "index"
      }

      format.json {
        @photos = Photo.where(:created_at.gt => Time.at(params[:last_update_time].to_i))
        @photos.each {|photo|
	dateTime = photo.created_at.localtime.to_s.gsub(/[TZ]/, 'Z' => "", 'T' => " ")
	photo.created_at = dateTime[0...dateTime.rindex(" ")]
	}
        render js: @photos.to_json
      }

      format.js {

        if(params[:show_type] == "find")
          @from_datetime = params[:datetimepicker1].to_time
          @to_datetime = params["datetimepicker2"].to_time
          @from_timestamp = @from_datetime.to_time.to_i
          @to_timestamp = @to_datetime.to_time.to_i

          @photos = Photo.where(:created_at => @from_timestamp..@to_timestamp).desc(:created_at).page(params[:page]).per(10)
        else
          @photos = Photo.all.desc(:created_at).page(params[:page]).per(10)
        end
      }
    end
  end

  def detail
    respond_to  do |format|
      format.html{
        @tab_type = "photos"
        @photo = Photo.where(id: params[:id]).first
      }
      format.mobile{
        redirect_to controller: "mobile_jumping", action: "detail/"+params[:id]
      }
    end
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.save

    respond_to do |format|
      format.json {render nothing: true}
    end
  end

  def download
    require 'open-uri'
    @photo = Photo.where(id: params[:id]).first.url_b
    @file = open(@photo).read
    send_data @file, type: 'image/jpg', disposition:'attachment'
  end
end
