class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :flickr_id, type: String
end
