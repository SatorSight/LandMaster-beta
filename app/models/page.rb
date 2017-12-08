class Page < ApplicationRecord
  validates :title,
            :start,
            :url,
            :button_text,
            :button_color,
            :store,
            :img_left,
            :img_right,
            :link,
            :img_bottom,
            presence: true
end