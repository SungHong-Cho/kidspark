class Size
  include Mongoid::Document
  include Mongoid::Timestamps

  field :label
  field :width, type: Integer
  field :height, type: Integer
  field :source
  field :url
  field :media
  embedded_in :photo
end
