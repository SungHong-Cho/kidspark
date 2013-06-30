class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  PHOTO_SOURCE_URL='http://farm%s.staticflickr.com/%s/%s_%s%s.%s'.freeze
  URL_PROFILE='http://www.flickr.com/people/'.freeze
  URL_PHOTOSTREAM='http://www.flickr.com/photos/'.freeze
  URL_SHORT='http://flic.kr/p/'.freeze

  field :flickr_id
  field :server
  field :farm
  field :secret

  BASE58_ALPHABET="123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ".freeze
  def base58(id)
    id = id.to_i
    alphabet = BASE58_ALPHABET.split(//)
    base = alphabet.length
    begin
      id, m = id.divmod(base)
      r = alphabet[m] + (r || '')
    end while id > 0
    r
  end

  def url; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "", "jpg"] end
  def url_m; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_m", "jpg"] end
  def url_s; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_s", "jpg"] end
  def url_t; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_t", "jpg"] end
  def url_b; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_b", "jpg"] end
  def url_z; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_z", "jpg"] end
  def url_q; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_q", "jpg"] end
  def url_n; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_n", "jpg"] end
  def url_c; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.secret, "_c", "jpg"] end
  def url_o; PHOTO_SOURCE_URL % [self.farm, self.server, self.flickr_id, self.originalsecret, "_o", self.originalformat] end
  def url_profile; URL_PROFILE + (self.owner.respond_to?(:nsid) ? self.owner.nsid : self.owner) + "/" end
  def url_short; URL_SHORT + base58(self.flickr_id) end
  def url_short_m; URL_SHORT + "img/" + base58(self.flickr_id) + "_m.jpg" end
  def url_short_s; URL_SHORT + "img/" + base58(self.flickr_id) + ".jpg" end
  def url_short_t; URL_SHORT + "img/" + base58(self.flickr_id) + "_t.jpg" end
  def url_short_q; URL_SHORT + "img/" + base58(self.flickr_id) + "_q.jpg" end
  def url_short_n; URL_SHORT + "img/" + base58(self.flickr_id) + "_n.jpg" end
end
