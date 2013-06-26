class Size
  include Mongoid::Document
  include Mongoid::Timestamps

  field :label
  field :width, type: Number
  field :height, type: Number
  field :source
  field :url
  field :media
  embeded_in :photo
end
