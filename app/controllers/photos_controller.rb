class PhotosController < ApplicationController
  def show
    @photos = Photo.all
    @default_from_datetime = -1.days.from_now
    @default_to_datetime = 0.days.from_now
    if(params[:show_type] == "find")
(1..5).each do |index|
puts params["find_from_datetime"]["post(#{index}i)"].to_i
end
      @from_datetime = DateTime.new(params["find_from_datetime"]["post(1i)"].to_i,
                                    params["find_from_datetime"]["post(2i)"].to_i,
                                    params["find_from_datetime"]["post(3i)"].to_i,
                                    params["find_from_datetime"]["post(4i)"].to_i,
                                    params["find_from_datetime"]["post(5i)"].to_i)
      @to_datetime = DateTime.new(params["find_to_datetime"]["post(1i)"].to_i,
                                  params["find_to_datetime"]["post(2i)"].to_i,
                                  params["find_to_datetime"]["post(3i)"].to_i,
                                  params["find_to_datetime"]["post(4i)"].to_i,
                                  params["find_to_datetime"]["post(5i)"].to_i)
      @from_timestamp = @from_datetime.to_time.to_i
      @to_timestamp = @to_datetime.to_time.to_i

      @photos = Photo.where(:created_at => @from_timestamp..@to_timestamp)
      @default_from_datetime = @from_datetime
      @default_to_datetime = @to_datetime

    end
  end

  def detail
    @photo = Photo.where(id: params[:id]).first
    
  end
end
