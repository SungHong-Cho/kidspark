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

  def url(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "", "jpg"] end
  def url_m(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_m", "jpg"] end
  def url_s(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_s", "jpg"] end
  def url_t(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_t", "jpg"] end
  def url_b(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_b", "jpg"] end
  def url_z(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_z", "jpg"] end
  def url_q(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_q", "jpg"] end
  def url_n(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_n", "jpg"] end
  def url_c(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.secret, "_c", "jpg"] end
  def url_o(r); PHOTO_SOURCE_URL % [r.farm, r.server, r.id, r.originalsecret, "_o", r.originalformat] end
  def url_profile(r); URL_PROFILE + (r.owner.respond_to?(:nsid) ? r.owner.nsid : r.owner) + "/" end
  def url_short(r); URL_SHORT + base58(r.id) end
  def url_short_m(r); URL_SHORT + "img/" + base58(r.id) + "_m.jpg" end
  def url_short_s(r); URL_SHORT + "img/" + base58(r.id) + ".jpg" end
  def url_short_t(r); URL_SHORT + "img/" + base58(r.id) + "_t.jpg" end
  def url_short_q(r); URL_SHORT + "img/" + base58(r.id) + "_q.jpg" end
  def url_short_n(r); URL_SHORT + "img/" + base58(r.id) + "_n.jpg" end
end
