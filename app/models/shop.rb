class Shop < ApplicationRecord
  belongs_to :category

  def self.marker_hash
    Rails.cache.fetch([self, :marker_hash]) do
      Gmaps4rails.build_markers(all) do |shop, marker|
        marker.lat shop.latitude
        marker.lng shop.longitude
        marker.json(id: shop.id)
        marker.infowindow shop.name
        marker.picture({ url: shop.icon, width: 64, height: 64 })
      end
    end
  end

  def icon
    case category_id
    when 1
      'http://maps.google.com/mapfiles/kml/pal2/icon62.png'
    when 2
      'https://www.gstatic.com/earth/images/stockicons/190201-2016-animal-paw_4x.png'
    when 3
      'http://maps.google.com/mapfiles/kml/shapes/firedept.png'
    when 4
      'http://maps.google.com/mapfiles/kml/shapes/salon.png'
    end
  end
end
