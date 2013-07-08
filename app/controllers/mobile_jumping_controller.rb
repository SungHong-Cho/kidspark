class MobileJumpingController < ApplicationController
  def index
    respond_to do |format|
      format.mobile{
        if(params[:show_type] == "find")
          @datetime = params[:datepicker].to_time
          @datetime_next = @datetime + 1.day
          @timestamp = @datetime.to_time.to_i
          @timestamp_next = @datetime_next.to_time.to_i
          @photos = Photo.where(:created_at => @timestamp..@timestamp_next).desc(:created_at).page(params[:page]).per(20)
        else
          @photos = Photo.all.desc(:created_at).page(params[:page]).per(20)
        end
      }

      format.html{
        redirect_to controller: "photos", action: "index"
      }
    end
  end

  def detail
    respond_to do |format|
      format.mobile{
        @photo = Photo.where(id: params[:id]).first
      }
      format.html{
        redirect_to controller: "photos", action: "detail/"+params[:id]
      }
    end
  end
end
